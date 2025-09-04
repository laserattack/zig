const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // Управляющие конструкции являются выражениями, они могут
    // возвращать значение и, соответственно, могут быть использованы в правой
    // части оператора присваивания.
    
    {
        // IF-ELSE_1 аналог тернарного оператора 
        const r = if (1 > 1000) true else false;
        print("{}\n", .{r}); // false
    }

    {
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
    }

    {
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

    {
        // БЛОКИ КАК ВЫРАЖЕНИЯ
        const calculated_value = metka: {
            const numbers = [_]u8{2,3,5,123};
            var sum: i32 = 0;
            for (numbers) |num| {
                sum += num;
                if (sum > 100) break :metka sum;
            }
            break :metka sum;
        };
        print("{}\n", .{calculated_value}); // 133

        // break :LABEL - конструкция выхода из блока с меткой
        var res: u8 = 0;
        meto4ka: {
            if (res == 0) {
                res += 1;
                break :meto4ka;
            }
            res += 2;
        }
        print("{}\n", .{res}); // 1
    }

    {
        // for
        // так работает только с беззнаковыми типами (range syntax)
        for (5..20) |i| {
            print("{} ", .{i}); // 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
        }
        print("\n", .{});
        
        // for итерирование по массиву
        const numbers = [_]u8{1,2,3,4,5};
        for (numbers) |number| {
            print("{} ", .{number}); // 1 2 3 4 5
        }
        print("\n", .{});

        // Цикл по сразу по нескольки массивам
        // они должны быть одинаковой длины
        const arr1 = [_]u8{1,2,3,4};
        const arr2 = [_]u8{1,2,3,4};
        const arr3 = [_]u8{1,2,3,4};
        var sum: u8 = 0;
        for (arr1, arr2, arr3) |el1, el2, el3| {
            sum += (el1 + el2 + el3);
        } 
        print("{}\n", .{sum}); // 30

        // FOR-ELSE
        // else выполнится если не было break (после последней итерации)
        const haystack = [_]u8{1,2,3,4,5};
        const needle = 5;
        const index = 
            // for вида (array, range)
            for (haystack, 0..) |value, i| {
                if (needle == value) {
                    break i; // Возвращаем индекс
                }
            } else null; 
        print("{any}\n", .{index}); // 4
        print("{s}\n", .{@typeName(@TypeOf(index))}); // ?usize (либо usize либо null)
    
        // WHILE
        var i: u8 = 5;
        while (i <= 20) {
            print("{} ", .{i}); // 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
            i += 1;
        }
        print("\n", .{});

        // можно также использовать дополнительный блок кода `: ()`
        // называемый `continue expression`, он выполняется после каждой итерации
        // включая итерацию с continue
        i = 5;
        while (i <= 20) : (i += 1) {
            print("{} ", .{i}); // 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
        }
        print("\n", .{});
    }
}
