const std = @import("std");

pub fn main() void {
    var x: i32 = 42;
    const ptr: *i32 = &x; // Указатель на x

    std.debug.print("x = {}\n", .{x}); // 42
    std.debug.print("ptr = {}\n", .{ptr}); // что то типо i32@7ffe4c4a9ce8
    std.debug.print("*ptr = {}\n", .{ptr.*}); // 42
}
