const std = @import("std");

// Публичная структура с полями-функциями
pub const M = struct {
    // Публичная функция сложения
    pub fn add(a: i32, b: i32) i32 {
        return a + b;
    }

    // Публичная константа
    pub const PI: f32 = 3.14159;

    // Приватная функция (недоступна при импорте)
    fn secret() void {
        std.debug.print("Секретная функция вызвана!\n", .{});
    }
};

// Публичная функция вне структуры (тоже часть модуля)
pub fn square(x: i32) i32 {
    return x * x;
}
