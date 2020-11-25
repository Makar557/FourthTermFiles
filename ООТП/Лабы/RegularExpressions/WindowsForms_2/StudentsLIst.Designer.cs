namespace WindowsForms_2
{
    partial class StudentsList
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
            this.StudentList_GroupBox = new System.Windows.Forms.GroupBox();
            this.Outrut_Button = new System.Windows.Forms.Button();
            this.ListBox = new System.Windows.Forms.ListBox();
            this.OutputData_Label = new System.Windows.Forms.Label();
            this.OutputData_Button = new System.Windows.Forms.Button();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.Search = new System.Windows.Forms.ToolStripMenuItem();
            this.StudentList_GroupBox.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // StudentList_GroupBox
            // 
            this.StudentList_GroupBox.Controls.Add(this.Outrut_Button);
            this.StudentList_GroupBox.Controls.Add(this.ListBox);
            this.StudentList_GroupBox.Location = new System.Drawing.Point(12, 31);
            this.StudentList_GroupBox.Name = "StudentList_GroupBox";
            this.StudentList_GroupBox.Size = new System.Drawing.Size(397, 233);
            this.StudentList_GroupBox.TabIndex = 2;
            this.StudentList_GroupBox.TabStop = false;
            this.StudentList_GroupBox.Text = "Фамилии студентов";
            // 
            // Outrut_Button
            // 
            this.Outrut_Button.Location = new System.Drawing.Point(283, 21);
            this.Outrut_Button.Name = "Outrut_Button";
            this.Outrut_Button.Size = new System.Drawing.Size(96, 23);
            this.Outrut_Button.TabIndex = 1;
            this.Outrut_Button.Text = "Показать";
            this.Outrut_Button.UseVisualStyleBackColor = true;
            this.Outrut_Button.Click += new System.EventHandler(this.Outrut_Button_Click);
            // 
            // ListBox
            // 
            this.ListBox.FormattingEnabled = true;
            this.ListBox.ItemHeight = 16;
            this.ListBox.Location = new System.Drawing.Point(9, 19);
            this.ListBox.Name = "ListBox";
            this.ListBox.Size = new System.Drawing.Size(373, 196);
            this.ListBox.TabIndex = 0;
            this.ListBox.SelectedIndexChanged += new System.EventHandler(this.ListBox_SelectedIndexChanged);
            // 
            // OutputData_Label
            // 
            this.OutputData_Label.Location = new System.Drawing.Point(18, 278);
            this.OutputData_Label.Name = "OutputData_Label";
            this.OutputData_Label.Size = new System.Drawing.Size(384, 310);
            this.OutputData_Label.TabIndex = 3;
            // 
            // OutputData_Button
            // 
            this.OutputData_Button.Location = new System.Drawing.Point(297, 278);
            this.OutputData_Button.Name = "OutputData_Button";
            this.OutputData_Button.Size = new System.Drawing.Size(96, 23);
            this.OutputData_Button.TabIndex = 4;
            this.OutputData_Button.Text = "Показать";
            this.OutputData_Button.UseVisualStyleBackColor = true;
            this.OutputData_Button.Click += new System.EventHandler(this.OutputData_Button_Click);
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.Search});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(414, 28);
            this.menuStrip1.TabIndex = 5;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // Search
            // 
            this.Search.Name = "Search";
            this.Search.Size = new System.Drawing.Size(66, 24);
            this.Search.Text = "Поиск";
            this.Search.Click += new System.EventHandler(this.Search_Click);
            // 
            // StudentsList
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(414, 597);
            this.Controls.Add(this.OutputData_Button);
            this.Controls.Add(this.OutputData_Label);
            this.Controls.Add(this.StudentList_GroupBox);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "StudentsList";
            this.Text = "StudentsLIst";
            this.StudentList_GroupBox.ResumeLayout(false);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.GroupBox StudentList_GroupBox;
        private System.Windows.Forms.ListBox ListBox;
        private System.Windows.Forms.Button Outrut_Button;
        private System.Windows.Forms.Label OutputData_Label;
        private System.Windows.Forms.Button OutputData_Button;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem Search;
    }
}