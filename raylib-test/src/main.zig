const std = @import("std");
const rl = @import("raylib");

pub fn main() !void {
    //Initializazion
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    //main loop
    while (!rl.windowShouldClose()) {
        //update
        //
        //draw
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.white);

        rl.drawText("Congrats! You made your first window", 190, 200, 20, rl.Color.light_gray);
    }
}
