const std = @import("std");
const rl = @import("raylib");

const prova = @import("finestra.zig");

pub fn main() !void {
    try prova.finestra(rl);
}
