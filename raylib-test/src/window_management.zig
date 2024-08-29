const rl = @import("raylib");

const screen_width = 900;
const screen_height = 600;

const GameScreen = enum {
    logo,
    title,
    gameplay,
    ending,
};

pub fn main() !void {
    //init
    rl.initWindow(screen_width, screen_height, "Gestore Finestre");
    defer rl.closeWindow(); //defer eseguirà questa funzione alla fine del programma

    var current_screen: GameScreen = .logo;

    var frame_counter: i32 = 0; //to count frames

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) { //detects windowClose or ESC key
        switch (current_screen) {
            .logo => {
                frame_counter += 1;

                if (frame_counter > 120) current_screen = .title; //conta i frame, a 2 secondi (120 fps) fai roba

            },
            .title => {
                if (rl.isKeyPressed(.key_enter) or rl.isGestureDetected(.gesture_tap)) {
                    current_screen = .gameplay;
                }
            },
            .gameplay => {
                if (rl.isKeyPressed(.key_enter) or rl.isGestureDetected(.gesture_tap)) {
                    current_screen = .ending;
                }
            },
            .ending => {
                if (rl.isKeyPressed(.key_enter) or rl.isGestureDetected(.gesture_tap)) {
                    current_screen = .title;
                }
            },
        }

        {
            rl.beginDrawing();
            defer rl.endDrawing();

            rl.clearBackground(rl.Color.ray_white);

            switch (current_screen) {
                .logo => {
                    rl.drawText(("LOGO SCREEN"), 20, 20, 40, rl.Color.light_gray);
                    rl.drawText("WAIT FOR 2 SECONDS", 290, 220, 20, rl.Color.gray);
                },
                .title => {
                    rl.drawRectangle(0, 0, screen_width, screen_height, rl.Color.green);
                    rl.drawText("TITLE SCREEN", 20, 20, 40, rl.Color.dark_green);
                    rl.drawText("PRESS ENTER or TAP to SWITCH to GAMEPLAY SCREEN", 120, 220, 20, rl.Color.dark_green);
                },
                .gameplay => {
                    rl.drawRectangle(0, 0, screen_width, screen_height, rl.Color.purple);
                    rl.drawText("GAMEPLAY SCREEN", 20, 20, 40, rl.Color.maroon);
                    rl.drawText("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, rl.Color.maroon);
                },
                .ending => {
                    rl.drawRectangle(0, 0, screen_width, screen_height, rl.Color.blue);
                    rl.drawText("ENDING SCREEN", 20, 20, 40, rl.Color.dark_blue);
                    rl.drawText("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 120, 220, 20, rl.Color.dark_blue);
                },
            }
        }
    }
}
