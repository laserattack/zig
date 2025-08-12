const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };
    print("message = {s}\n", .{message}); // message = hello
    print("len of message = {}\n", .{message.len}); // len of message = 5
    print("type of message = {}\n", .{@TypeOf(message)}); // type of message = [5]u8
}
