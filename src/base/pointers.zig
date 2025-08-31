const std = @import("std");
const print = std.debug.print; 

pub fn main() void {
    const arr = [_]u8{1,2,3,4,5}; 
    print("arr type = {s}\n", .{@typeName(@TypeOf(arr))});
   
    // Zig разрешает арифметику для [*]T (many pointers), но запрещает для *T (single pointers)

    // Первый вариант
    {
        var arr_ptr: [*]const u8 = &arr;
        print("{}\n", .{arr_ptr[0]}); // 1
        arr_ptr += 1;
        print("{}\n", .{arr_ptr[0]}); // 2
    }
    // Второй вариант
    {
        print("{}\n", .{@as(*const u8, @ptrFromInt(@intFromPtr(&arr) + 0)).*}); // 1
        print("{}\n", .{@as(*const u8, @ptrFromInt(@intFromPtr(&arr) + 1)).*}); // 2
    }
}
