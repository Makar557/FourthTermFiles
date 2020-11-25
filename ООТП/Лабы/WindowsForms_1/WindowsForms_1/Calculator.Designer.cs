namespace WindowsForms_1
{
    partial class Calculator
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.buttonOct = new System.Windows.Forms.Button();
            this.buttonDec = new System.Windows.Forms.Button();
            this.buttonHex = new System.Windows.Forms.Button();
            this.buttonNumber7 = new System.Windows.Forms.Button();
            this.buttonNumber8 = new System.Windows.Forms.Button();
            this.buttonBin = new System.Windows.Forms.Button();
            this.buttonNumber9 = new System.Windows.Forms.Button();
            this.buttonNumber0 = new System.Windows.Forms.Button();
            this.buttonNumber4 = new System.Windows.Forms.Button();
            this.buttonNumber5 = new System.Windows.Forms.Button();
            this.buttonNumber6 = new System.Windows.Forms.Button();
            this.buttonAnd = new System.Windows.Forms.Button();
            this.buttonNumber1 = new System.Windows.Forms.Button();
            this.buttonNumber2 = new System.Windows.Forms.Button();
            this.buttonNumber3 = new System.Windows.Forms.Button();
            this.buttonOr = new System.Windows.Forms.Button();
            this.buttonEnter = new System.Windows.Forms.Button();
            this.buttonClear = new System.Windows.Forms.Button();
            this.buttonNot = new System.Windows.Forms.Button();
            this.buttonOrNot = new System.Windows.Forms.Button();
            this.buttonDelete = new System.Windows.Forms.Button();
            this.Label = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // buttonOct
            // 
            this.buttonOct.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonOct.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonOct.Location = new System.Drawing.Point(310, 402);
            this.buttonOct.Margin = new System.Windows.Forms.Padding(4);
            this.buttonOct.Name = "buttonOct";
            this.buttonOct.Size = new System.Drawing.Size(100, 100);
            this.buttonOct.TabIndex = 1;
            this.buttonOct.Text = "oct";
            this.buttonOct.UseVisualStyleBackColor = false;
            this.buttonOct.Click += new System.EventHandler(this.buttonOct_Click);
            // 
            // buttonDec
            // 
            this.buttonDec.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonDec.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonDec.Location = new System.Drawing.Point(310, 302);
            this.buttonDec.Margin = new System.Windows.Forms.Padding(4);
            this.buttonDec.Name = "buttonDec";
            this.buttonDec.Size = new System.Drawing.Size(100, 100);
            this.buttonDec.TabIndex = 2;
            this.buttonDec.Text = "dec";
            this.buttonDec.UseVisualStyleBackColor = false;
            this.buttonDec.Click += new System.EventHandler(this.buttonDec_Click);
            // 
            // buttonHex
            // 
            this.buttonHex.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonHex.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonHex.Location = new System.Drawing.Point(310, 202);
            this.buttonHex.Margin = new System.Windows.Forms.Padding(4);
            this.buttonHex.Name = "buttonHex";
            this.buttonHex.Size = new System.Drawing.Size(100, 100);
            this.buttonHex.TabIndex = 3;
            this.buttonHex.Text = "hex";
            this.buttonHex.UseVisualStyleBackColor = false;
            this.buttonHex.Click += new System.EventHandler(this.buttonHex_Click);
            // 
            // buttonNumber7
            // 
            this.buttonNumber7.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber7.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber7.Location = new System.Drawing.Point(10, 202);
            this.buttonNumber7.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber7.Name = "buttonNumber7";
            this.buttonNumber7.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber7.TabIndex = 4;
            this.buttonNumber7.Text = "7";
            this.buttonNumber7.UseVisualStyleBackColor = false;
            this.buttonNumber7.Click += new System.EventHandler(this.buttonNumber7_Click);
            // 
            // buttonNumber8
            // 
            this.buttonNumber8.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber8.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber8.Location = new System.Drawing.Point(110, 202);
            this.buttonNumber8.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber8.Name = "buttonNumber8";
            this.buttonNumber8.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber8.TabIndex = 5;
            this.buttonNumber8.Text = "8";
            this.buttonNumber8.UseVisualStyleBackColor = false;
            this.buttonNumber8.Click += new System.EventHandler(this.buttonNumber8_Click);
            // 
            // buttonBin
            // 
            this.buttonBin.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonBin.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonBin.Location = new System.Drawing.Point(310, 502);
            this.buttonBin.Margin = new System.Windows.Forms.Padding(4);
            this.buttonBin.Name = "buttonBin";
            this.buttonBin.Size = new System.Drawing.Size(100, 100);
            this.buttonBin.TabIndex = 7;
            this.buttonBin.Text = "bin";
            this.buttonBin.UseVisualStyleBackColor = false;
            this.buttonBin.Click += new System.EventHandler(this.buttonBin_Click);
            // 
            // buttonNumber9
            // 
            this.buttonNumber9.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber9.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber9.Location = new System.Drawing.Point(210, 202);
            this.buttonNumber9.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber9.Name = "buttonNumber9";
            this.buttonNumber9.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber9.TabIndex = 8;
            this.buttonNumber9.Text = "9";
            this.buttonNumber9.UseVisualStyleBackColor = false;
            this.buttonNumber9.Click += new System.EventHandler(this.buttonNumber9_Click);
            // 
            // buttonNumber0
            // 
            this.buttonNumber0.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber0.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber0.Location = new System.Drawing.Point(110, 502);
            this.buttonNumber0.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber0.Name = "buttonNumber0";
            this.buttonNumber0.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber0.TabIndex = 9;
            this.buttonNumber0.Text = "0";
            this.buttonNumber0.UseVisualStyleBackColor = false;
            this.buttonNumber0.Click += new System.EventHandler(this.buttonNumber0_Click);
            // 
            // buttonNumber4
            // 
            this.buttonNumber4.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber4.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber4.Location = new System.Drawing.Point(10, 302);
            this.buttonNumber4.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber4.Name = "buttonNumber4";
            this.buttonNumber4.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber4.TabIndex = 10;
            this.buttonNumber4.Text = "4";
            this.buttonNumber4.UseVisualStyleBackColor = false;
            this.buttonNumber4.Click += new System.EventHandler(this.buttonNumber4_Click);
            // 
            // buttonNumber5
            // 
            this.buttonNumber5.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber5.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber5.Location = new System.Drawing.Point(110, 302);
            this.buttonNumber5.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber5.Name = "buttonNumber5";
            this.buttonNumber5.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber5.TabIndex = 11;
            this.buttonNumber5.Text = "5";
            this.buttonNumber5.UseVisualStyleBackColor = false;
            this.buttonNumber5.Click += new System.EventHandler(this.buttonNumber5_Click);
            // 
            // buttonNumber6
            // 
            this.buttonNumber6.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber6.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber6.Location = new System.Drawing.Point(210, 302);
            this.buttonNumber6.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber6.Name = "buttonNumber6";
            this.buttonNumber6.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber6.TabIndex = 12;
            this.buttonNumber6.Text = "6";
            this.buttonNumber6.UseVisualStyleBackColor = false;
            this.buttonNumber6.Click += new System.EventHandler(this.buttonNumber6_Click);
            // 
            // buttonAnd
            // 
            this.buttonAnd.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.buttonAnd.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonAnd.Location = new System.Drawing.Point(210, 102);
            this.buttonAnd.Margin = new System.Windows.Forms.Padding(4);
            this.buttonAnd.Name = "buttonAnd";
            this.buttonAnd.Size = new System.Drawing.Size(100, 100);
            this.buttonAnd.TabIndex = 13;
            this.buttonAnd.Text = "and";
            this.buttonAnd.UseVisualStyleBackColor = false;
            this.buttonAnd.Click += new System.EventHandler(this.buttonAnd_Click);
            // 
            // buttonNumber1
            // 
            this.buttonNumber1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber1.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber1.Location = new System.Drawing.Point(10, 402);
            this.buttonNumber1.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber1.Name = "buttonNumber1";
            this.buttonNumber1.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber1.TabIndex = 14;
            this.buttonNumber1.Text = "1";
            this.buttonNumber1.UseVisualStyleBackColor = false;
            this.buttonNumber1.Click += new System.EventHandler(this.buttonNumber1_Click);
            // 
            // buttonNumber2
            // 
            this.buttonNumber2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber2.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber2.Location = new System.Drawing.Point(110, 402);
            this.buttonNumber2.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber2.Name = "buttonNumber2";
            this.buttonNumber2.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber2.TabIndex = 15;
            this.buttonNumber2.Text = "2";
            this.buttonNumber2.UseVisualStyleBackColor = false;
            this.buttonNumber2.Click += new System.EventHandler(this.buttonNumber2_Click);
            // 
            // buttonNumber3
            // 
            this.buttonNumber3.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.buttonNumber3.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F);
            this.buttonNumber3.Location = new System.Drawing.Point(210, 402);
            this.buttonNumber3.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNumber3.Name = "buttonNumber3";
            this.buttonNumber3.Size = new System.Drawing.Size(100, 100);
            this.buttonNumber3.TabIndex = 16;
            this.buttonNumber3.Text = "3";
            this.buttonNumber3.UseVisualStyleBackColor = false;
            this.buttonNumber3.Click += new System.EventHandler(this.buttonNumber3_Click);
            // 
            // buttonOr
            // 
            this.buttonOr.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.buttonOr.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonOr.Location = new System.Drawing.Point(10, 502);
            this.buttonOr.Margin = new System.Windows.Forms.Padding(4);
            this.buttonOr.Name = "buttonOr";
            this.buttonOr.Size = new System.Drawing.Size(100, 100);
            this.buttonOr.TabIndex = 17;
            this.buttonOr.Text = "or";
            this.buttonOr.UseVisualStyleBackColor = false;
            this.buttonOr.Click += new System.EventHandler(this.buttonOr_Click);
            // 
            // buttonEnter
            // 
            this.buttonEnter.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.buttonEnter.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.buttonEnter.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.buttonEnter.Location = new System.Drawing.Point(325, 5);
            this.buttonEnter.Margin = new System.Windows.Forms.Padding(4);
            this.buttonEnter.Name = "buttonEnter";
            this.buttonEnter.Size = new System.Drawing.Size(70, 89);
            this.buttonEnter.TabIndex = 18;
            this.buttonEnter.Text = "Enter";
            this.buttonEnter.UseVisualStyleBackColor = false;
            this.buttonEnter.Click += new System.EventHandler(this.buttonEnter_Click);
            // 
            // buttonClear
            // 
            this.buttonClear.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.buttonClear.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.buttonClear.Location = new System.Drawing.Point(10, 102);
            this.buttonClear.Margin = new System.Windows.Forms.Padding(4);
            this.buttonClear.Name = "buttonClear";
            this.buttonClear.Size = new System.Drawing.Size(100, 100);
            this.buttonClear.TabIndex = 19;
            this.buttonClear.Text = "Clear";
            this.buttonClear.UseVisualStyleBackColor = false;
            this.buttonClear.Click += new System.EventHandler(this.buttonClear_Click);
            // 
            // buttonNot
            // 
            this.buttonNot.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.buttonNot.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonNot.Location = new System.Drawing.Point(310, 102);
            this.buttonNot.Margin = new System.Windows.Forms.Padding(4);
            this.buttonNot.Name = "buttonNot";
            this.buttonNot.Size = new System.Drawing.Size(100, 100);
            this.buttonNot.TabIndex = 20;
            this.buttonNot.Text = "not";
            this.buttonNot.UseVisualStyleBackColor = false;
            this.buttonNot.Click += new System.EventHandler(this.buttonNot_Click);
            // 
            // buttonOrNot
            // 
            this.buttonOrNot.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.buttonOrNot.Font = new System.Drawing.Font("Microsoft Sans Serif", 15F);
            this.buttonOrNot.Location = new System.Drawing.Point(210, 502);
            this.buttonOrNot.Margin = new System.Windows.Forms.Padding(4);
            this.buttonOrNot.Name = "buttonOrNot";
            this.buttonOrNot.Size = new System.Drawing.Size(100, 100);
            this.buttonOrNot.TabIndex = 21;
            this.buttonOrNot.Text = "or not";
            this.buttonOrNot.UseVisualStyleBackColor = false;
            this.buttonOrNot.Click += new System.EventHandler(this.buttonOrNot_Click);
            // 
            // buttonDelete
            // 
            this.buttonDelete.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(128)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.buttonDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F);
            this.buttonDelete.Location = new System.Drawing.Point(110, 102);
            this.buttonDelete.Name = "buttonDelete";
            this.buttonDelete.Size = new System.Drawing.Size(100, 100);
            this.buttonDelete.TabIndex = 22;
            this.buttonDelete.Text = "Delete";
            this.buttonDelete.UseVisualStyleBackColor = false;
            this.buttonDelete.Click += new System.EventHandler(this.buttonDelete_Click);
            // 
            // Label
            // 
            this.Label.Font = new System.Drawing.Font("Microsoft Sans Serif", 17F);
            this.Label.Location = new System.Drawing.Point(10, 5);
            this.Label.Name = "Label";
            this.Label.Size = new System.Drawing.Size(300, 93);
            this.Label.TabIndex = 23;
            this.Label.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(422, 610);
            this.Controls.Add(this.Label);
            this.Controls.Add(this.buttonDelete);
            this.Controls.Add(this.buttonOrNot);
            this.Controls.Add(this.buttonNot);
            this.Controls.Add(this.buttonClear);
            this.Controls.Add(this.buttonEnter);
            this.Controls.Add(this.buttonOr);
            this.Controls.Add(this.buttonNumber3);
            this.Controls.Add(this.buttonNumber2);
            this.Controls.Add(this.buttonNumber1);
            this.Controls.Add(this.buttonAnd);
            this.Controls.Add(this.buttonNumber6);
            this.Controls.Add(this.buttonNumber5);
            this.Controls.Add(this.buttonNumber4);
            this.Controls.Add(this.buttonNumber0);
            this.Controls.Add(this.buttonNumber9);
            this.Controls.Add(this.buttonBin);
            this.Controls.Add(this.buttonNumber8);
            this.Controls.Add(this.buttonNumber7);
            this.Controls.Add(this.buttonHex);
            this.Controls.Add(this.buttonDec);
            this.Controls.Add(this.buttonOct);
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button buttonOct;
        private System.Windows.Forms.Button buttonDec;
        private System.Windows.Forms.Button buttonHex;
        private System.Windows.Forms.Button buttonNumber7;
        private System.Windows.Forms.Button buttonNumber8;
        private System.Windows.Forms.Button buttonBin;
        private System.Windows.Forms.Button buttonNumber9;
        private System.Windows.Forms.Button buttonNumber0;
        private System.Windows.Forms.Button buttonNumber4;
        private System.Windows.Forms.Button buttonNumber5;
        private System.Windows.Forms.Button buttonNumber6;
        private System.Windows.Forms.Button buttonAnd;
        private System.Windows.Forms.Button buttonNumber1;
        private System.Windows.Forms.Button buttonNumber2;
        private System.Windows.Forms.Button buttonNumber3;
        private System.Windows.Forms.Button buttonOr;
        private System.Windows.Forms.Button buttonEnter;
        private System.Windows.Forms.Button buttonClear;
        private System.Windows.Forms.Button buttonNot;
        private System.Windows.Forms.Button buttonOrNot;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Label Label;
    }
}

