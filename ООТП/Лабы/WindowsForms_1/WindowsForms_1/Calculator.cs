using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsForms_1
{
    public partial class Calculator : Form
    {
        enum CurrentBase
        {
            bin = 2, oct = 8, dec = 10, hex = 16
        }
        CurrentBase currentBase;

        string Label1;
        string Label2;

        bool nowIsOperation;

        public Calculator()
        {
            InitializeComponent();
            currentBase = CurrentBase.dec;
        }

        private void buttonNumber0_Click(object sender, EventArgs e)
        {
            if(Label.Text.Length< 14 && (currentBase==CurrentBase.dec || nowIsOperation))
                Label.Text += '0';
        }

        private void buttonNumber1_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '1';
        }

        private void buttonNumber2_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '2';
        }

        private void buttonNumber3_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '3';
        }

        private void buttonNumber4_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '4';
        }

        private void buttonNumber5_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '5';
        }

        private void buttonNumber6_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '6';
        }

        private void buttonNumber7_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '7';
        }

        private void buttonNumber8_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '8';
        }

        private void buttonNumber9_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length < 14 && (currentBase == CurrentBase.dec || nowIsOperation))
                Label.Text += '9';
        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            if(Label.Text.Length>0 && nowIsOperation == false)
                Label.Text = Label.Text.Remove(Label.Text.Length - 1, 1);

            if (Label.Text.Length == 0)
                currentBase = CurrentBase.dec;
        }

        private void buttonClear_Click(object sender, EventArgs e)
        {
            Label.Text = "";
            currentBase = CurrentBase.dec;
            nowIsOperation = false;
        }

        private void buttonBin_Click(object sender, EventArgs e)
        {
            if(Label.Text.Length!= 0 && !nowIsOperation)
            {
                switch (currentBase)
                {
                    case CurrentBase.bin:
                        break;
                    case CurrentBase.oct:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 8), 2);
                        break;
                    case CurrentBase.dec:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 10), 2);
                        break;
                    case CurrentBase.hex:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 16), 2);
                        break;
                }
                currentBase = CurrentBase.bin;
            }
        }

        private void buttonOct_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length != 0 && !nowIsOperation)
            {
                switch (currentBase)
                {
                    case CurrentBase.bin:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 2), 8);
                        break;
                    case CurrentBase.oct:
                        break;
                    case CurrentBase.dec:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 10), 8);
                        break;
                    case CurrentBase.hex:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 16), 8);
                        break;
                }
                currentBase = CurrentBase.oct;
            }
        }

        private void buttonDec_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length != 0 && !nowIsOperation)
            {
                switch (currentBase)
                {
                    case CurrentBase.bin:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 2), 10);
                        break;
                    case CurrentBase.oct:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 8), 10);
                        break;
                    case CurrentBase.dec:
                        break;
                    case CurrentBase.hex:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 16), 10);
                        break;
                }
                currentBase = CurrentBase.dec;
            }
        }

        private void buttonHex_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length != 0 && !nowIsOperation)
            {
                switch (currentBase)
                {
                    case CurrentBase.bin:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 2), 16);
                        break;
                    case CurrentBase.oct:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 8), 16);
                        break;
                    case CurrentBase.dec:
                        Label.Text = Convert.ToString(Convert.ToInt32(Label.Text, 10), 16);
                        break;
                    case CurrentBase.hex:
                        break;
                }
                currentBase = CurrentBase.hex;
            }
        }

        private void buttonAnd_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length != 0 && !nowIsOperation)
            {
                Label1 = Label.Text;
                Label.Text += " * ";
                nowIsOperation = true;
            }
        }

        private void buttonEnter_Click(object sender, EventArgs e)
        {
            if(nowIsOperation)
            {
                int secondOperandPosition;

                if (Label.Text.IndexOf(" * ") != -1)
                {
                    secondOperandPosition = Label.Text.IndexOf(" * ") + 3;
                    if (secondOperandPosition < Label.Text.Length)
                    {
                        Label2 = Label.Text.Substring(secondOperandPosition);

                        switch (currentBase)
                        {
                            case CurrentBase.bin:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 2) & Convert.ToInt32(Label2));
                                break;
                            case CurrentBase.oct:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 8) & Convert.ToInt32(Label2));
                                break;
                            case CurrentBase.dec:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 10) & Convert.ToInt32(Label2));
                                break;
                            case CurrentBase.hex:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 16) & Convert.ToInt32(Label2));
                                break;
                        }
                        nowIsOperation = false;
                    }
                    else return;
                    
                }
                
                if (Label.Text.IndexOf(" + ") != -1)
                {
                    secondOperandPosition = Label.Text.IndexOf(" + ") + 3;
                    if (secondOperandPosition < Label.Text.Length)
                    {
                        Label2 = Label.Text.Substring(secondOperandPosition);

                        switch (currentBase)
                        {
                            case CurrentBase.bin:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 2) | Convert.ToInt32(Label2));
                                break;
                            case CurrentBase.oct:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 8) | Convert.ToInt32(Label2));
                                break;
                            case CurrentBase.dec:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 10) | Convert.ToInt32(Label2));
                                break;
                            case CurrentBase.hex:
                                Label.Text = Convert.ToString(Convert.ToInt32(Label1, 16) | Convert.ToInt32(Label2));
                                break;
                        }
                        nowIsOperation = false;
                    }
                    else return;


                }

                if (Label.Text.IndexOf(" +~ ") != -1)
                {
                    secondOperandPosition = Label.Text.IndexOf(" +~ ") + 4;
                    if (secondOperandPosition < Label.Text.Length)
                    {
                        Label2 = Label.Text.Substring(secondOperandPosition);

                        switch (currentBase)
                        {
                            case CurrentBase.bin:
                                Label.Text = Convert.ToString(~(Convert.ToInt32(Label1, 2) | Convert.ToInt32(Label2)));
                                break;
                            case CurrentBase.oct:
                                Label.Text = Convert.ToString(~(Convert.ToInt32(Label1, 8) | Convert.ToInt32(Label2)));
                                break;
                            case CurrentBase.dec:
                                Label.Text = Convert.ToString(~(Convert.ToInt32(Label1, 10) | Convert.ToInt32(Label2)));
                                break;
                            case CurrentBase.hex:
                                Label.Text = Convert.ToString(~(Convert.ToInt32(Label1, 16) | Convert.ToInt32(Label2)));
                                break;
                        }
                        nowIsOperation = false;
                    }
                    else return;


                }
            }
            
        }

        private void buttonNot_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length != 0 && !nowIsOperation)
            {
                switch (currentBase)
                {
                    case CurrentBase.bin:
                        Label.Text = Convert.ToString(~Convert.ToInt32(Label.Text, 2));
                        break;
                    case CurrentBase.oct:
                        Label.Text = Convert.ToString(~Convert.ToInt32(Label.Text, 8));
                        break;
                    case CurrentBase.dec:
                        Label.Text = Convert.ToString(~Convert.ToInt32(Label.Text));
                        break;
                    case CurrentBase.hex:
                        Label.Text = Convert.ToString(~Convert.ToInt32(Label.Text, 16));
                        break;
                }
                currentBase = CurrentBase.dec;
            }
        }

        private void buttonOr_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length != 0 && !nowIsOperation)
            {
                Label1 = Label.Text;
                Label.Text += " + ";
                nowIsOperation = true;
            }
        }

        private void buttonOrNot_Click(object sender, EventArgs e)
        {
            if (Label.Text.Length != 0 && !nowIsOperation)
            {
                Label1 = Label.Text;
                Label.Text += " +~ ";
                nowIsOperation = true;
            }
        }
    }
}
