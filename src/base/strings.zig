const std = @import("std");
const print = std.debug.print;

pub fn main() void { 
    // Напечатает *const [16:0]u8
    // т.е. это указатель на неизменяемый массив из 16 u8 и 17-м \0
    // print(
    //    "string litereal type = {s}\n",
    //    .{@typeName(@TypeOf("Now i use Zigggg"))}
    // );

    const str_literal: *const [16:0]u8 = "Now i use Zigggg";
    print("string literal type = {s}\n", .{@typeName(@TypeOf(str_literal))}); // *const [16:0]u8
    print("string literal addr = 0x{x}\n", .{@intFromPtr(str_literal)}); // 0x11991b5
    print("string literal len = {}\n", .{str_literal.len});


    // Тут происходит неявное преобразование строки *const [16:0]u8 в [*]const u8
    // и упаковка в структуру {ptr, len}
    // по сути это очень похожие вещи, т.к. такой слайс
    // не получится изменить через str[ind] = val (т.к. он константный) + 
    // длина известна потому что слайс обязательно содержит полем длину
    // т.е. неизменяемость и безопасность сохраняются
    const str: []const u8 = "Now i use Zigggg";
    print("string literal type = {s}\n", .{@typeName(@TypeOf(str.ptr))}); // [*]const u8
    print("string literal addr = 0x{x}\n", .{@intFromPtr(str.ptr)}); // 0x11991b5
    print("string literal len = {}\n", .{str.len});
}
