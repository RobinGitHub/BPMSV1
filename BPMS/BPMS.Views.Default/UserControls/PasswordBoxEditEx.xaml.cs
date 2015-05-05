using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace BPMS.Views.Default
{
    /// <summary>
    /// PasswordBoxEditEx.xaml 的交互逻辑
    /// </summary>
    public partial class PasswordBoxEditEx : UserControl
    {
        public PasswordBoxEditEx()
        {
            InitializeComponent();
            this.lblTip.MouseMove += lblTip_MouseMove;
        }

        [Description("提示内容"), Browsable(true), Category("其他")]
        public string Tips { get; set; }

        [Description("提示显示隐藏"), Category("其他")]
        public Visibility TipVisibility
        {
            get { return lblTip.Visibility; }
            set 
            {
                if (lblTip.Visibility != value)
                {
                    lblTip.Visibility = value;
                    if (value == System.Windows.Visibility.Visible)
                    {
                        tipControl.ShowTip(lblTip, Tips, this);
                    }
                }
            }
        }
        [Description("宽度"), Category("其他")]
        public double TxtWidth { get { return txtPwd.Width; } set { txtPwd.Width = value; } }
        [Description("宽度"), Category("其他")]
        public double TxtHeight { get { return txtPwd.Height; } set { txtPwd.Height = value; } }

        void lblTip_MouseMove(object sender, MouseEventArgs e)
        {
            if (lblTip.Visibility == System.Windows.Visibility.Visible)
            {
                tipControl.ShowTip(lblTip, Tips, this);
            }
        }
    }
}
