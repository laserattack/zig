const std = @import("std");
const expect = std.testing.expect;
const print = std.debug.print;
const eql = std.mem.eql;
const allocator = std.heap.page_allocator;

test "init string" {
    // Строки в Zig - это просто последовательности (массивы или срезы) байтов (u8)
    // строковый литералы хранятся в каком то месте в памяти
    const name = "serr";
    try expect(@TypeOf(name) == *const [4:0]u8);
}
