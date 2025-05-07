Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = "PowerShell Multi-Tool"
$form.Size = New-Object System.Drawing.Size(300, 450)
$form.StartPosition = "CenterScreen"

# Create buttons
$buttonChrome = New-Object System.Windows.Forms.Button
$buttonChrome.Text = "Open Google Chrome"
$buttonChrome.Location = New-Object System.Drawing.Point(50, 20)
$buttonChrome.Size = New-Object System.Drawing.Size(200, 30)
$buttonChrome.Add_Click({
    Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe"
})
$form.Controls.Add($buttonChrome)

$buttonNotepad = New-Object System.Windows.Forms.Button
$buttonNotepad.Text = "Open Notepad"
$buttonNotepad.Location = New-Object System.Drawing.Point(50, 60)
$buttonNotepad.Size = New-Object System.Drawing.Size(200, 30)
$buttonNotepad.Add_Click({
    Start-Process notepad
})
$form.Controls.Add($buttonNotepad)

$buttonCDrive = New-Object System.Windows.Forms.Button
$buttonCDrive.Text = "Open C: Drive"
$buttonCDrive.Location = New-Object System.Drawing.Point(50, 100)
$buttonCDrive.Size = New-Object System.Drawing.Size(200, 30)
$buttonCDrive.Add_Click({
    Start-Process explorer.exe -ArgumentList "C:\"
})
$form.Controls.Add($buttonCDrive)

$buttonWebsite = New-Object System.Windows.Forms.Button
$buttonWebsite.Text = "Open a Website"
$buttonWebsite.Location = New-Object System.Drawing.Point(50, 140)
$buttonWebsite.Size = New-Object System.Drawing.Size(200, 30)
$buttonWebsite.Add_Click({
    $url = Read-Host "Enter the website URL (e.g., https://www.google.com)"
    if ($url) {
        Start-Process $url
    }
})
$form.Controls.Add($buttonWebsite)

$buttonShutdown = New-Object System.Windows.Forms.Button
$buttonShutdown.Text = "Shutdown Computer"
$buttonShutdown.Location = New-Object System.Drawing.Point(50, 180)
$buttonShutdown.Size = New-Object System.Drawing.Size(200, 30)
$buttonShutdown.Add_Click({
    $confirm = [System.Windows.Forms.MessageBox]::Show("Are you sure you want to shutdown the computer?", "Confirm Shutdown", "YesNo", "Warning")
    if ($confirm -eq "Yes") {
        Stop-Computer -Force
    }
})
$form.Controls.Add($buttonShutdown)

$buttonRestart = New-Object System.Windows.Forms.Button
$buttonRestart.Text = "Restart Computer"
$buttonRestart.Location = New-Object System.Drawing.Point(50, 220)
$buttonRestart.Size = New-Object System.Drawing.Size(200, 30)
$buttonRestart.Add_Click({
    $confirm = [System.Windows.Forms.MessageBox]::Show("Are you sure you want to restart the computer?", "Confirm Restart", "YesNo", "Warning")
    if ($confirm -eq "Yes") {
        Restart-Computer -Force
    }
})
$form.Controls.Add($buttonRestart)

$buttonWSL = New-Object System.Windows.Forms.Button
$buttonWSL.Text = "Open WSL"
$buttonWSL.Location = New-Object System.Drawing.Point(50, 260)
$buttonWSL.Size = New-Object System.Drawing.Size(200, 30)
$buttonWSL.Add_Click({
    Start-Process wsl
})
$form.Controls.Add($buttonWSL)

$buttonNotification = New-Object System.Windows.Forms.Button
$buttonNotification.Text = "Notification Badge Maker"
$buttonNotification.Location = New-Object System.Drawing.Point(50, 300)
$buttonNotification.Size = New-Object System.Drawing.Size(200, 30)
$buttonNotification.Add_Click({
    # Create a custom input form
    $inputForm = New-Object System.Windows.Forms.Form
    $inputForm.Text = "Notification Badge Maker"
    $inputForm.Size = New-Object System.Drawing.Size(300, 200)
    $inputForm.StartPosition = "CenterScreen"

    # Add a label for the title
    $labelTitle = New-Object System.Windows.Forms.Label
    $labelTitle.Text = "Enter the notification title:"
    $labelTitle.Location = New-Object System.Drawing.Point(20, 20)
    $labelTitle.AutoSize = $true
    $inputForm.Controls.Add($labelTitle)

    # Add a text box for the title
    $textBoxTitle = New-Object System.Windows.Forms.TextBox
    $textBoxTitle.Location = New-Object System.Drawing.Point(20, 50)
    $textBoxTitle.Size = New-Object System.Drawing.Size(250, 20)
    $inputForm.Controls.Add($textBoxTitle)

    # Add a label for the message
    $labelMessage = New-Object System.Windows.Forms.Label
    $labelMessage.Text = "Enter the notification message:"
    $labelMessage.Location = New-Object System.Drawing.Point(20, 80)
    $labelMessage.AutoSize = $true
    $inputForm.Controls.Add($labelMessage)

    # Add a text box for the message
    $textBoxMessage = New-Object System.Windows.Forms.TextBox
    $textBoxMessage.Location = New-Object System.Drawing.Point(20, 110)
    $textBoxMessage.Size = New-Object System.Drawing.Size(250, 20)
    $inputForm.Controls.Add($textBoxMessage)

    # Add a label for the notification type
    $labelType = New-Object System.Windows.Forms.Label
    $labelType.Text = "Select notification type:"
    $labelType.Location = New-Object System.Drawing.Point(20, 140)
    $labelType.AutoSize = $true
    $inputForm.Controls.Add($labelType)

    # Add a combo box for the notification type
    $comboBoxType = New-Object System.Windows.Forms.ComboBox
    $comboBoxType.Location = New-Object System.Drawing.Point(20, 160)
    $comboBoxType.Size = New-Object System.Drawing.Size(250, 20)
    $comboBoxType.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    $comboBoxType.Items.Add("Info")
    $comboBoxType.Items.Add("Warning")
    $comboBoxType.Items.Add("Error")
    $comboBoxType.SelectedIndex = 0
    $inputForm.Controls.Add($comboBoxType)

    # Add an OK button
    $buttonOK = New-Object System.Windows.Forms.Button
    $buttonOK.Text = "OK"
    $buttonOK.Location = New-Object System.Drawing.Point(100, 190)
    $buttonOK.Size = New-Object System.Drawing.Size(80, 30)
    $buttonOK.Add_Click({
        $title = $textBoxTitle.Text
        $message = $textBoxMessage.Text
        $type = $comboBoxType.SelectedItem

        if ($title -and $message) {
            # Map the selected type to the corresponding ToolTipIcon
            $icon = [System.Windows.Forms.ToolTipIcon]::None
            switch ($type) {
                "Info" { $icon = [System.Windows.Forms.ToolTipIcon]::Info }
                "Warning" { $icon = [System.Windows.Forms.ToolTipIcon]::Warning }
                "Error" { $icon = [System.Windows.Forms.ToolTipIcon]::Error }
            }

            # Create a system tray notification
            $notify = New-Object System.Windows.Forms.NotifyIcon
            $notify.Icon = [System.Drawing.SystemIcons]::Information
            $notify.Visible = $true
            $notify.ShowBalloonTip(0, $title, $message, $icon)

            # Dispose of the notification after 5 seconds
            Start-Sleep -Seconds 5
            $notify.Dispose()
        }

        # Close the input form
        $inputForm.Close()
    })
    $inputForm.Controls.Add($buttonOK)

    # Show the input form
    $inputForm.ShowDialog()
})
$form.Controls.Add($buttonNotification)

$buttonExit = New-Object System.Windows.Forms.Button
$buttonExit.Text = "Exit"
$buttonExit.Location = New-Object System.Drawing.Point(50, 380)
$buttonExit.Size = New-Object System.Drawing.Size(200, 30)
$buttonExit.Add_Click({
    $form.Close()
})
$form.Controls.Add($buttonExit)

# Show the form
$form.ShowDialog()
