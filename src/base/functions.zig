const std = @import("std");

pub fn main() void {
    const sum = add_good(8999, 2);
    std.debug.print("8999 + 2 = {d}\n", .{sum});
    // _ = add_bad(1, 2); // error: cannot assign to constant
}

fn add_good(a: i64, b: i64) i64 {
    return a + b;
}

// параметры функция являются константами
fn add_bad(a: i64, b: i64) i64 {
    a += b; // error: cannot assign to constant
    return a;
}
