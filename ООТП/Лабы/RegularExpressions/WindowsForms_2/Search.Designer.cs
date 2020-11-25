namespace WindowsForms_2
{
    partial class Search
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
            this.Search_Label = new System.Windows.Forms.Label();
            this.ComboBox = new System.Windows.Forms.ComboBox();
            this.SearchResult_Label = new System.Windows.Forms.Label();
            this.Search_Button = new System.Windows.Forms.Button();
            this.Specialty_TextBox = new System.Windows.Forms.TextBox();
            this.Specialty_Label = new System.Windows.Forms.Label();
            this.Specialty_Button = new System.Windows.Forms.Button();
            this.Course_Button = new System.Windows.Forms.Button();
            this.Course_Label = new System.Windows.Forms.Label();
            this.Course_TextBox = new System.Windows.Forms.TextBox();
            this.AverageMark_Button = new System.Windows.Forms.Button();
            this.AverageMark_Label = new System.Windows.Forms.Label();
            this.AverageMark_TextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.ListBox = new System.Windows.Forms.ListBox();
            this.Specialty_RadioButton = new System.Windows.Forms.RadioButton();
            this.Course_RadioButton = new System.Windows.Forms.RadioButton();
            this.AVG_RadioButton = new System.Windows.Forms.RadioButton();
            this.Sort_Label = new System.Windows.Forms.Label();
            this.Save_Button = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // Search_Label
            // 
            this.Search_Label.AutoSize = true;
            this.Search_Label.Location = new System.Drawing.Point(13, 13);
            this.Search_Label.Name = "Search_Label";
            this.Search_Label.Size = new System.Drawing.Size(106, 17);
            this.Search_Label.TabIndex = 0;
            this.Search_Label.Text = "Поиск по ФИО";
            // 
            // ComboBox
            // 
            this.ComboBox.FormattingEnabled = true;
            this.ComboBox.Location = new System.Drawing.Point(125, 10);
            this.ComboBox.Name = "ComboBox";
            this.ComboBox.Size = new System.Drawing.Size(153, 24);
            this.ComboBox.TabIndex = 1;
            // 
            // SearchResult_Label
            // 
            this.SearchResult_Label.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.SearchResult_Label.Location = new System.Drawing.Point(13, 50);
            this.SearchResult_Label.Name = "SearchResult_Label";
            this.SearchResult_Label.Size = new System.Drawing.Size(337, 291);
            this.SearchResult_Label.TabIndex = 2;
            // 
            // Search_Button
            // 
            this.Search_Button.Location = new System.Drawing.Point(284, 3);
            this.Search_Button.Name = "Search_Button";
            this.Search_Button.Size = new System.Drawing.Size(66, 37);
            this.Search_Button.TabIndex = 3;
            this.Search_Button.Text = "клик";
            this.Search_Button.UseVisualStyleBackColor = true;
            this.Search_Button.Click += new System.EventHandler(this.Search_Button_Click);
            // 
            // Specialty_TextBox
            // 
            this.Specialty_TextBox.Location = new System.Drawing.Point(537, 52);
            this.Specialty_TextBox.Name = "Specialty_TextBox";
            this.Specialty_TextBox.Size = new System.Drawing.Size(100, 22);
            this.Specialty_TextBox.TabIndex = 4;
            // 
            // Specialty_Label
            // 
            this.Specialty_Label.AutoSize = true;
            this.Specialty_Label.Location = new System.Drawing.Point(372, 55);
            this.Specialty_Label.Name = "Specialty_Label";
            this.Specialty_Label.Size = new System.Drawing.Size(107, 17);
            this.Specialty_Label.TabIndex = 5;
            this.Specialty_Label.Text = "Поиск по спец.";
            // 
            // Specialty_Button
            // 
            this.Specialty_Button.Location = new System.Drawing.Point(657, 45);
            this.Specialty_Button.Name = "Specialty_Button";
            this.Specialty_Button.Size = new System.Drawing.Size(66, 37);
            this.Specialty_Button.TabIndex = 6;
            this.Specialty_Button.Text = "клик";
            this.Specialty_Button.UseVisualStyleBackColor = true;
            this.Specialty_Button.Click += new System.EventHandler(this.Specialty_Button_Click);
            // 
            // Course_Button
            // 
            this.Course_Button.Location = new System.Drawing.Point(657, 86);
            this.Course_Button.Name = "Course_Button";
            this.Course_Button.Size = new System.Drawing.Size(66, 37);
            this.Course_Button.TabIndex = 9;
            this.Course_Button.Text = "клик";
            this.Course_Button.UseVisualStyleBackColor = true;
            this.Course_Button.Click += new System.EventHandler(this.Course_Button_Click);
            // 
            // Course_Label
            // 
            this.Course_Label.AutoSize = true;
            this.Course_Label.Location = new System.Drawing.Point(372, 96);
            this.Course_Label.Name = "Course_Label";
            this.Course_Label.Size = new System.Drawing.Size(108, 17);
            this.Course_Label.TabIndex = 8;
            this.Course_Label.Text = "Поиск по курсу";
            // 
            // Course_TextBox
            // 
            this.Course_TextBox.Location = new System.Drawing.Point(537, 93);
            this.Course_TextBox.Name = "Course_TextBox";
            this.Course_TextBox.Size = new System.Drawing.Size(100, 22);
            this.Course_TextBox.TabIndex = 7;
            // 
            // AverageMark_Button
            // 
            this.AverageMark_Button.Location = new System.Drawing.Point(657, 127);
            this.AverageMark_Button.Name = "AverageMark_Button";
            this.AverageMark_Button.Size = new System.Drawing.Size(66, 37);
            this.AverageMark_Button.TabIndex = 12;
            this.AverageMark_Button.Text = "клик";
            this.AverageMark_Button.UseVisualStyleBackColor = true;
            this.AverageMark_Button.Click += new System.EventHandler(this.AverageMark_Button_Click);
            // 
            // AverageMark_Label
            // 
            this.AverageMark_Label.AutoSize = true;
            this.AverageMark_Label.Location = new System.Drawing.Point(372, 137);
            this.AverageMark_Label.Name = "AverageMark_Label";
            this.AverageMark_Label.Size = new System.Drawing.Size(134, 17);
            this.AverageMark_Label.TabIndex = 11;
            this.AverageMark_Label.Text = "Поиск по ср. баллу";
            // 
            // AverageMark_TextBox
            // 
            this.AverageMark_TextBox.Location = new System.Drawing.Point(537, 134);
            this.AverageMark_TextBox.Name = "AverageMark_TextBox";
            this.AverageMark_TextBox.Size = new System.Drawing.Size(100, 22);
            this.AverageMark_TextBox.TabIndex = 10;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(372, 173);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(130, 17);
            this.label2.TabIndex = 14;
            this.label2.Text = "Результат поиска:";
            // 
            // ListBox
            // 
            this.ListBox.BackColor = System.Drawing.SystemColors.Control;
            this.ListBox.FormattingEnabled = true;
            this.ListBox.ItemHeight = 16;
            this.ListBox.Location = new System.Drawing.Point(375, 193);
            this.ListBox.Name = "ListBox";
            this.ListBox.Size = new System.Drawing.Size(243, 148);
            this.ListBox.TabIndex = 15;
            this.ListBox.SelectedIndexChanged += new System.EventHandler(this.ListBox_SelectedIndexChanged);
            // 
            // Specialty_RadioButton
            // 
            this.Specialty_RadioButton.AutoSize = true;
            this.Specialty_RadioButton.Location = new System.Drawing.Point(642, 224);
            this.Specialty_RadioButton.Name = "Specialty_RadioButton";
            this.Specialty_RadioButton.Size = new System.Drawing.Size(129, 21);
            this.Specialty_RadioButton.TabIndex = 16;
            this.Specialty_RadioButton.TabStop = true;
            this.Specialty_RadioButton.Text = "специальности";
            this.Specialty_RadioButton.UseVisualStyleBackColor = true;
            this.Specialty_RadioButton.CheckedChanged += new System.EventHandler(this.Specialty_RadioButton_CheckedChanged);
            // 
            // Course_RadioButton
            // 
            this.Course_RadioButton.AutoSize = true;
            this.Course_RadioButton.Location = new System.Drawing.Point(642, 262);
            this.Course_RadioButton.Name = "Course_RadioButton";
            this.Course_RadioButton.Size = new System.Drawing.Size(65, 21);
            this.Course_RadioButton.TabIndex = 17;
            this.Course_RadioButton.TabStop = true;
            this.Course_RadioButton.Text = "курсу";
            this.Course_RadioButton.UseVisualStyleBackColor = true;
            this.Course_RadioButton.CheckedChanged += new System.EventHandler(this.Course_RadioButton_CheckedChanged);
            // 
            // AVG_RadioButton
            // 
            this.AVG_RadioButton.AutoSize = true;
            this.AVG_RadioButton.Location = new System.Drawing.Point(642, 298);
            this.AVG_RadioButton.Name = "AVG_RadioButton";
            this.AVG_RadioButton.Size = new System.Drawing.Size(135, 21);
            this.AVG_RadioButton.TabIndex = 18;
            this.AVG_RadioButton.TabStop = true;
            this.AVG_RadioButton.Text = "среднему баллу";
            this.AVG_RadioButton.UseVisualStyleBackColor = true;
            this.AVG_RadioButton.CheckedChanged += new System.EventHandler(this.AVG_RadioButton_CheckedChanged);
            // 
            // Sort_Label
            // 
            this.Sort_Label.AutoSize = true;
            this.Sort_Label.Location = new System.Drawing.Point(639, 193);
            this.Sort_Label.Name = "Sort_Label";
            this.Sort_Label.Size = new System.Drawing.Size(106, 17);
            this.Sort_Label.TabIndex = 19;
            this.Sort_Label.Text = "Сортировка по";
            // 
            // Save_Button
            // 
            this.Save_Button.Location = new System.Drawing.Point(500, 347);
            this.Save_Button.Name = "Save_Button";
            this.Save_Button.Size = new System.Drawing.Size(118, 48);
            this.Save_Button.TabIndex = 20;
            this.Save_Button.Text = "SAVE RESULT";
            this.Save_Button.UseVisualStyleBackColor = true;
            this.Save_Button.Click += new System.EventHandler(this.Save_Button_Click);
            // 
            // Search
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(787, 423);
            this.Controls.Add(this.Save_Button);
            this.Controls.Add(this.Sort_Label);
            this.Controls.Add(this.AVG_RadioButton);
            this.Controls.Add(this.Course_RadioButton);
            this.Controls.Add(this.Specialty_RadioButton);
            this.Controls.Add(this.ListBox);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.AverageMark_Button);
            this.Controls.Add(this.AverageMark_Label);
            this.Controls.Add(this.AverageMark_TextBox);
            this.Controls.Add(this.Course_Button);
            this.Controls.Add(this.Course_Label);
            this.Controls.Add(this.Course_TextBox);
            this.Controls.Add(this.Specialty_Button);
            this.Controls.Add(this.Specialty_Label);
            this.Controls.Add(this.Specialty_TextBox);
            this.Controls.Add(this.Search_Button);
            this.Controls.Add(this.SearchResult_Label);
            this.Controls.Add(this.ComboBox);
            this.Controls.Add(this.Search_Label);
            this.Name = "Search";
            this.Text = "Поиск";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label Search_Label;
        private System.Windows.Forms.ComboBox ComboBox;
        private System.Windows.Forms.Label SearchResult_Label;
        private System.Windows.Forms.Button Search_Button;
        private System.Windows.Forms.TextBox Specialty_TextBox;
        private System.Windows.Forms.Label Specialty_Label;
        private System.Windows.Forms.Button Specialty_Button;
        private System.Windows.Forms.Button Course_Button;
        private System.Windows.Forms.Label Course_Label;
        private System.Windows.Forms.TextBox Course_TextBox;
        private System.Windows.Forms.Button AverageMark_Button;
        private System.Windows.Forms.Label AverageMark_Label;
        private System.Windows.Forms.TextBox AverageMark_TextBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListBox ListBox;
        private System.Windows.Forms.RadioButton Specialty_RadioButton;
        private System.Windows.Forms.RadioButton Course_RadioButton;
        private System.Windows.Forms.RadioButton AVG_RadioButton;
        private System.Windows.Forms.Label Sort_Label;
        private System.Windows.Forms.Button Save_Button;
    }
}