using System.Windows.Controls;
using UserControl = System.Windows.Controls.UserControl;

namespace Torch.API
{
    public interface IServerControls
    {
        bool AddGUITab(string name, UserControl control);
        bool RemoveGUITab(string name);
    }
}