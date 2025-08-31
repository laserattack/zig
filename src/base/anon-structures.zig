const std = @import("std");

// .{} - синтаксис для литерала анонимной структуры
const point = .{
    .x = 10,
    .y = 20,
    .name = "origin",
};

pub fn main() void {
    const typeName = @typeName(@TypeOf(point));
    std.debug.print("Struct type: {s}\n", .{typeName});
}
