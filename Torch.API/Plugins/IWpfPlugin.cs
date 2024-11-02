﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using UserControl = System.Windows.Controls.UserControl;

namespace Torch.API.Plugins
{
    public interface IWpfPlugin : ITorchPlugin
    {
        /// <summary>
        /// Used by the server's WPF interface to load custom plugin controls.
        /// You must instantiate your plugin's control object here, otherwise it will not be owned by the correct thread for WPF.
        /// </summary>
        UserControl GetControl();
    }
}
