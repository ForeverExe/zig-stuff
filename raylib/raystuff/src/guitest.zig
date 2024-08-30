const std = @import("std");
const rl = @import("raylib");
const rg = @import("raygui");

pub fn main() !void {
    //TODO: Creare una finestra dove posso inserire delle stringhe e poi le ristampa in una label.

    rl.initWindow(900, 600, "Raygui test");
    defer rl.closeWindow();
    rl.setTargetFPS(60);

    var showMessageBox: bool = false;

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.getColor(@intCast(rg.guiGetStyle(rg.GuiState.state_normal, rg.GuiControlProperty.base_color_normal))));
        if (rg.guiButton(rl.Rectangle.init(24, 24, 120, 30), "#191#ShowMessage") != 0) showMessageBox = true;

        if (showMessageBox) {
            const result = rg.guiMessageBox(rl.Rectangle.init(85, 70, 250, 100), "#191#Message Box", "Questo è un messaggio!", "Oh;Figo");
            if (result >= 0) showMessageBox = false;
        }
    }
}
