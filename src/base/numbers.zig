const std = @import("std");

pub fn main() void {
    const a: u1337 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF * 10;
    std.debug.print("{}\n{}\n", .{ a, a - 1 });
}
