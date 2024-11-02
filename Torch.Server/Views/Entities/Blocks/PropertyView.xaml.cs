﻿using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Torch.Server.ViewModels.Entities.Blocks;
using Torch.Server.Views.Converters;

namespace Torch.Server.Views.Blocks
{
    /// <summary>
    /// Interaction logic for PropertyView.xaml
    /// </summary>
    public partial class PropertyView : UserControl
    {
        public PropertyView()
        {
            InitializeComponent();
            DataContextChanged += OnDataContextChanged;

            ThemeControl.UpdateDynamicControls += UpdateResourceDict;
            UpdateResourceDict(ThemeControl.currentTheme);
        }

        public void UpdateResourceDict(ResourceDictionary dictionary)
        {
            this.Resources.MergedDictionaries.Clear();
            this.Resources.MergedDictionaries.Add(dictionary);
        }

        private void OnDataContextChanged(object sender, DependencyPropertyChangedEventArgs args)
        {
            switch (args.NewValue)
            {
                case PropertyViewModel<bool> _:
                    InitBool();
                    break;
                case PropertyViewModel<StringBuilder> _:
                    InitStringBuilder();
                    break;
                default:
                    InitDefault();
                    break;
            }
        }

        private void InitStringBuilder()
        {
            var textBox = new TextBox { VerticalAlignment = VerticalAlignment.Center, HorizontalAlignment = HorizontalAlignment.Stretch };
            var binding = new Binding("Value") { Source = DataContext, Converter = new StringBuilderConverter()};
            textBox.SetBinding(TextBox.TextProperty, binding);
            Frame.Content = textBox;

        }

        private void InitBool()
        {
            var checkBox = new CheckBox {VerticalAlignment = VerticalAlignment.Center, HorizontalAlignment = HorizontalAlignment.Left};
            var binding = new Binding("Value") { Source = DataContext };
            checkBox.SetBinding(CheckBox.IsCheckedProperty, binding);
            Frame.Content = checkBox;
        }

        private void InitDefault()
        {
            var textBox = new TextBox { VerticalAlignment = VerticalAlignment.Center, HorizontalAlignment = HorizontalAlignment.Stretch};
            var binding = new Binding("Value") { Source = DataContext };
            textBox.SetBinding(TextBox.TextProperty, binding);
            Frame.Content = textBox;
        }
    }
}
