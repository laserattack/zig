const std = @import("std");

pub fn main() void {
    const a: u256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    std.debug.print("{}\n", .{a - 1});
}
