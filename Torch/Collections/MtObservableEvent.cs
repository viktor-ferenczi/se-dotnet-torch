using System;
using System.Diagnostics;
using System.Reflection;
using System.Threading;
using System.Windows.Threading;

namespace Torch.Collections
{
    /// <summary>
    /// Event that invokes handlers registered by dispatchers on dispatchers.
    /// </summary>
    /// <typeparam name="TEvtArgs">Event argument type</typeparam>
    /// <typeparam name="TEvtHandle">Event handler delegate type</typeparam>
    public sealed class MtObservableEvent<TEvtArgs, TEvtHandle> where TEvtArgs : EventArgs
    {
        private delegate void DelInvokeHandler(TEvtHandle handler, object sender, TEvtArgs args);

        private static readonly DelInvokeHandler _invokeDirectly;
        static MtObservableEvent()
        {
            MethodInfo invoke = typeof(TEvtHandle).GetMethod("Invoke", BindingFlags.Instance | BindingFlags.Public | BindingFlags.DeclaredOnly);
            Debug.Assert(invoke != null, "No invoke method on handler type");
            _invokeDirectly = (DelInvokeHandler)Delegate.CreateDelegate(typeof(DelInvokeHandler), invoke);
        }

        private static Dispatcher CurrentDispatcher => Dispatcher.FromThread(Thread.CurrentThread);


        private event EventHandler<TEvtArgs> Event;

        private int _observerCount = 0;

        /// <summary>
        /// Determines if this event has an observers.
        /// </summary>
        public bool IsObserved => _observerCount > 0;

        /// <summary>
        /// Raises this event for the given sender, with the given args
        /// </summary>
        /// <param name="sender">sender</param>
        /// <param name="args">args</param>
        public void Raise(object sender, TEvtArgs args)
        {
            Event?.Invoke(sender, args);
        }

        /// <summary>
        /// Adds the given event handler.
        /// </summary>
        /// <param name="evt"></param>
        public void Add(TEvtHandle evt)
        {
            if (evt == null)
                return;
            _observerCount++;
            Event += new DispatcherDelegate(evt).Invoke;
        }

        /// <summary>
        /// Removes the given event handler
        /// </summary>
        /// <param name="evt"></param>
        public void Remove(TEvtHandle evt)
        {
            if (Event == null || evt == null)
                return;
            Delegate[] invokeList = Event.GetInvocationList();
            for (int i = invokeList.Length - 1; i >= 0; i--)
            {
                var wrapper = (DispatcherDelegate)invokeList[i].Target;
                if (wrapper._delegate.Equals(evt))
                {
                    Event -= wrapper.Invoke;
                    _observerCount--;
                    return;
                }
            }
        }

        private struct DispatcherDelegate
        {
            private readonly Dispatcher _dispatcher;
            internal readonly TEvtHandle _delegate;

            internal DispatcherDelegate(TEvtHandle del)
            {
                _dispatcher = CurrentDispatcher;
                _delegate = del;
            }

            public void Invoke(object sender, TEvtArgs args)
            {
                if (_dispatcher == null || _dispatcher == CurrentDispatcher)
                    _invokeDirectly(_delegate, sender, args);
                else
                    // (Delegate) (object) == dual cast so that the compiler likes it
                    _dispatcher.BeginInvoke((Delegate)(object)_delegate, DispatcherPriority.DataBind, sender, args);
            }
        }
    }
}