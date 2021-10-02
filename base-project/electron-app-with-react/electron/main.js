const { app, BrowserWindow } = require('electron');
// const path = require("path");

function createWindow() {
    const win = new BrowserWindow({
        width: 800,
        height: 600,
        autoHideMenuBar: true,
        webPreferences: {
            nodeIntegration: true
        }
    })

    // win.loadFile('public/index.html');
    win.loadURL('http://localhost:3000');
}

app.whenReady().then(() => {
    createWindow()
})

app.whenReady().then(() => {
    app.on('activate', function () {
        if (BrowserWindow.getAllWindows().length === 0) createWindow()
    })
})

app.on('window-all-closed', function () {
    if (process.platform !== 'darwin') app.quit()
})
