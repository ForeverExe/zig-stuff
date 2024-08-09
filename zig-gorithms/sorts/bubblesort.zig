const std = @import("std");

pub fn main() void {
    var input = [5]u8{ 1, 9, 6, 2, 4 };

    var len = input.len; //segno lunghezza array
    while (len > 1) {
        var new_len: usize = 0;
        for (input[0 .. len - 1], 0..) |value, i| { //ciclo l'array
            //se il valore è maggiore del successivo, scambio
            if (value > input[i + 1]) {
                std.mem.swap(u8, &input[i], &input[i + 1]);
                new_len = i + 1;
            }
        }
        //ad ogni ciclo, vado avanti con l'array
        len = new_len;
    }

    std.debug.print("Sorted Array: {any}", .{input});
}
