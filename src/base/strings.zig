const std = @import("std");
const print = std.debug.print;

pub fn main() void { 
    // Напечатает *const [16:0]u8
    // т.е. это указатель на неизменяемый массив из 16 u8 и 17-м \0
    print(
        "string litereal type = {s}\n",
        .{@typeName(@TypeOf("Now i use Zigggg"))}
    );

    const str_literal: *const [16:0]u8 = "Now i use Zigggg";
    // str_literal = "0123456789123456"; // error: cannot assign to constant
    print(
        "string litereal type = {s}\n",
        .{@typeName(@TypeOf(str_literal))}
    );

    // Небольшое отступление насчет const, var
    {
        var str_literal_mut: *const [16:0]u8 = "Now i use Zigggg";
        str_literal_mut = "0123456789123456";
        // str_literal_mut[2] = "X"; // error: cannot assign to constant
    }
}
