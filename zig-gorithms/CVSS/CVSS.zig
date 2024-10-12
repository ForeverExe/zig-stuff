const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    var input: [7]u8 = undefined;
    //var macro_v: []u8 = undefined;

    try stdout.print("Inserisci la stringa CVSS: \nCVSS:4.0/", .{});
    _ = try stdin.readUntilDelimiter(&input, '\n');
    if (!std.mem.eql(u8, &input, "debug")) {
        try stdout.print("{s}", .{input});
    } else {
        try stdout.print("AV:N/AC:L/AT:N/PR:H/UI:N/VC:L/VI:L/VA:N/SC:N/SI:N/SA:N", .{});
    }
}
