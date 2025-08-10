const std = @import("std");

pub fn main() void {
    const a: u256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    std.debug.print("{}\n{}\n", .{ a, a - 1 });
}
