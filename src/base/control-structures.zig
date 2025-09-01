const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // Управляющие конструкции являются выражениями, они могут
    // возвращать значение и, соответственно, могут быть использованы в правой
    // части оператора присваивания.
    
    // IF-ELSE_1 аналог тернарного оператора 
    const r = if (1 > 1000) true else false;
    print("{}\n", .{r}); // false

    // IF-ELSE_2
    const age: u8 = 13;
    const category = if (age < 13) 
        "child" 
    else if (age < 18) 
        "teenager" 
    else 
        "adult";

    print("{s}\n", .{category}); // teenager
    print("{s}\n", .{@typeName(@TypeOf(category))}); // *const [8:0]u8

    // SWITCH
    const Operation = enum { add, subtract, multiply, divide };
    // каждый enum - уникальный тип
    const op = Operation.add; // add - сущность типа Operation
    print("{s}\n", .{@typeName(@TypeOf(op))}); // control-structures.main.Operation
    const a = 1;
    const b = 2;
    const result = switch (op) {
        .add => a + b, // сахар для Operation.add 
        .subtract => a - b,
        .multiply => a * b,
        .divide => if (b == 0) 0 else a / b,
    };
    print("{}\n", .{result}); // 3
}
