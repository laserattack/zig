const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // Массивы имеют фиксированный размер,
    // их длина (количество элементов) известна во время компиляции.
    // Длина является составляющей частью типа, то есть
    // массив из 4-х знаковых целых ([4]i32) и
    // массив из 5-ти знаковых целых ([5]i32) - это разные типы.
    // const message = [5]u8{ 'h', 'e', 'l', 'l', 'o' }; // явное указание длины
    const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' }; // компилятор сам выведет длину
    print("message = {s}\n", .{message}); // message = hello
    print("len of message = {}\n", .{message.len}); // len of message = 5
    print("type of message = {}\n", .{@TypeOf(message)}); // type of message = [5]u8
}
