const std = @import("std");
const print = std.debug.print; 

fn foo(arr: [5]u8) void {
    print("arr addr in function = 0x{x}\n", .{@intFromPtr(&arr)});
    print("arr 1st el ({}) addr in function = 0x{x}\n", .{arr[0], @intFromPtr(&arr[0])});
}

fn bar(p_arr: *const [5]u8) void {
    print("arr addr in function = 0x{x}\n", .{@intFromPtr(p_arr)});
    print("arr 1st el ({}) addr in function = 0x{x}\n", .{p_arr[0], @intFromPtr(&p_arr[0])});
}

pub fn main() void {
    const arr = [_]u8{1,2,3,4,5};
    print("arr type = {s}\n", .{@typeName(@TypeOf(arr))});

    const p_arr = &arr;
    print("ptr arr type = {s}\n", .{@typeName(@TypeOf(p_arr))});
    print("arr addr = 0x{x}\n", .{@intFromPtr(p_arr)});
    print("arr 1st el addr = 0x{x}\n", .{@intFromPtr(&arr[0])});

    foo(arr);
    bar(&arr);

    var arry = [_]u8{1,2,3,4,5};
    arry[0] = 22;
}
