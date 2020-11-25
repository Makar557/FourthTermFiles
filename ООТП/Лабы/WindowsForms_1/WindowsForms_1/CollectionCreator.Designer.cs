namespace WindowsForms_1
{
    partial class CollectionCreator
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.NumericUpDown = new System.Windows.Forms.NumericUpDown();
            this.buttonGeneration = new System.Windows.Forms.Button();
            this.buttonAscSort = new System.Windows.Forms.Button();
            this.buttonDescSort = new System.Windows.Forms.Button();
            this.buttonMinValue = new System.Windows.Forms.Button();
            this.buttonMaxValue = new System.Windows.Forms.Button();
            this.buttonAvgValue = new System.Windows.Forms.Button();
            this.ListBox1 = new System.Windows.Forms.ListBox();
            this.buttonClear = new System.Windows.Forms.Button();
            this.RequestLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.NumericUpDown)).BeginInit();
            this.SuspendLayout();
            // 
            // NumericUpDown
            // 
            this.NumericUpDown.Font = new System.Drawing.Font("Microsoft Sans Serif", 23F);
            this.NumericUpDown.Location = new System.Drawing.Point(10, 10);
            this.NumericUpDown.Maximum = new decimal(new int[] {
            10000,
            0,
            0,
            0});
            this.NumericUpDown.Name = "NumericUpDown";
            this.NumericUpDown.Size = new System.Drawing.Size(182, 51);
            this.NumericUpDown.TabIndex = 0;
            this.NumericUpDown.ValueChanged += new System.EventHandler(this.numericUpDown1_ValueChanged);
            // 
            // buttonGeneration
            // 
            this.buttonGeneration.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F);
            this.buttonGeneration.Location = new System.Drawing.Point(198, 10);
            this.buttonGeneration.Name = "buttonGeneration";
            this.buttonGeneration.Size = new System.Drawing.Size(167, 51);
            this.buttonGeneration.TabIndex = 1;
            this.buttonGeneration.Text = "Сгенерировать\r\nколлекцию";
            this.buttonGeneration.UseVisualStyleBackColor = true;
            this.buttonGeneration.Click += new System.EventHandler(this.buttonGeneration_Click);
            // 
            // buttonAscSort
            // 
            this.buttonAscSort.Location = new System.Drawing.Point(370, 10);
            this.buttonAscSort.Name = "buttonAscSort";
            this.buttonAscSort.Size = new System.Drawing.Size(110, 80);
            this.buttonAscSort.TabIndex = 3;
            this.buttonAscSort.Text = "Asc sort";
            this.buttonAscSort.UseVisualStyleBackColor = true;
            this.buttonAscSort.Click += new System.EventHandler(this.buttonAscSort_Click);
            // 
            // buttonDescSort
            // 
            this.buttonDescSort.Location = new System.Drawing.Point(480, 10);
            this.buttonDescSort.Name = "buttonDescSort";
            this.buttonDescSort.Size = new System.Drawing.Size(110, 80);
            this.buttonDescSort.TabIndex = 4;
            this.buttonDescSort.Text = "Desc sort";
            this.buttonDescSort.UseVisualStyleBackColor = true;
            this.buttonDescSort.Click += new System.EventHandler(this.buttonDescSort_Click);
            // 
            // buttonMinValue
            // 
            this.buttonMinValue.Location = new System.Drawing.Point(370, 90);
            this.buttonMinValue.Name = "buttonMinValue";
            this.buttonMinValue.Size = new System.Drawing.Size(110, 80);
            this.buttonMinValue.TabIndex = 5;
            this.buttonMinValue.Text = "Min value";
            this.buttonMinValue.UseVisualStyleBackColor = true;
            this.buttonMinValue.Click += new System.EventHandler(this.buttonMinValue_Click);
            // 
            // buttonMaxValue
            // 
            this.buttonMaxValue.Location = new System.Drawing.Point(480, 90);
            this.buttonMaxValue.Name = "buttonMaxValue";
            this.buttonMaxValue.Size = new System.Drawing.Size(110, 80);
            this.buttonMaxValue.TabIndex = 6;
            this.buttonMaxValue.Text = "Max value";
            this.buttonMaxValue.UseVisualStyleBackColor = true;
            this.buttonMaxValue.Click += new System.EventHandler(this.buttonMaxValue_Click);
            // 
            // buttonAvgValue
            // 
            this.buttonAvgValue.Location = new System.Drawing.Point(370, 170);
            this.buttonAvgValue.Name = "buttonAvgValue";
            this.buttonAvgValue.Size = new System.Drawing.Size(110, 80);
            this.buttonAvgValue.TabIndex = 7;
            this.buttonAvgValue.Text = "Avg value";
            this.buttonAvgValue.UseVisualStyleBackColor = true;
            this.buttonAvgValue.Click += new System.EventHandler(this.buttonAvgValue_Click);
            // 
            // ListBox1
            // 
            this.ListBox1.FormattingEnabled = true;
            this.ListBox1.ItemHeight = 16;
            this.ListBox1.Location = new System.Drawing.Point(10, 65);
            this.ListBox1.Name = "ListBox1";
            this.ListBox1.Size = new System.Drawing.Size(355, 292);
            this.ListBox1.TabIndex = 9;
            // 
            // buttonClear
            // 
            this.buttonClear.Location = new System.Drawing.Point(480, 170);
            this.buttonClear.Name = "buttonClear";
            this.buttonClear.Size = new System.Drawing.Size(110, 80);
            this.buttonClear.TabIndex = 10;
            this.buttonClear.Text = "Clear";
            this.buttonClear.UseVisualStyleBackColor = true;
            this.buttonClear.Click += new System.EventHandler(this.buttonClear_Click);
            // 
            // RequestLabel
            // 
            this.RequestLabel.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.RequestLabel.Location = new System.Drawing.Point(371, 253);
            this.RequestLabel.Name = "RequestLabel";
            this.RequestLabel.Size = new System.Drawing.Size(219, 104);
            this.RequestLabel.TabIndex = 11;
            // 
            // CollectionCreator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(599, 367);
            this.Controls.Add(this.RequestLabel);
            this.Controls.Add(this.buttonClear);
            this.Controls.Add(this.ListBox1);
            this.Controls.Add(this.buttonAvgValue);
            this.Controls.Add(this.buttonMaxValue);
            this.Controls.Add(this.buttonMinValue);
            this.Controls.Add(this.buttonDescSort);
            this.Controls.Add(this.buttonAscSort);
            this.Controls.Add(this.buttonGeneration);
            this.Controls.Add(this.NumericUpDown);
            this.Name = "CollectionCreator";
            this.Text = "Form2";
            ((System.ComponentModel.ISupportInitialize)(this.NumericUpDown)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.NumericUpDown NumericUpDown;
        private System.Windows.Forms.Button buttonGeneration;
        private System.Windows.Forms.Button buttonAscSort;
        private System.Windows.Forms.Button buttonDescSort;
        private System.Windows.Forms.Button buttonMinValue;
        private System.Windows.Forms.Button buttonMaxValue;
        private System.Windows.Forms.Button buttonAvgValue;
        private System.Windows.Forms.ListBox ListBox1;
        private System.Windows.Forms.Button buttonClear;
        private System.Windows.Forms.Label RequestLabel;
    }
}