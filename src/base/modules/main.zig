const std = @import("std");
const m = @import("module.zig");

pub fn main() void {
    // Доступ к функции внутри структуры Math
    const sum = m.M.add(5, 3);
    std.debug.print("5 + 3 = {}\n", .{sum});

    // Доступ к константе PI
    std.debug.print("PI ≈ {d:.5}\n", .{m.M.PI});

    // Доступ к функции square (не вложена в структуру)
    std.debug.print("Квадрат 4 = {}\n", .{m.square(4)});

    // m.M.secret(); // error: 'secret' is not marked 'pub'
}
