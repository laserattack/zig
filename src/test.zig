const std = @import("std");
const print = std.debug.print; 

// про массивы
fn ex_arr() void {
    print("\nEX_ARR\n", .{});
    const arr = [_]i32{1,2,3,4,5};
    print("array type = {s}\n", .{@typeName(@TypeOf(arr))}); // [5]i32
    // len - compile time константа, типо макроса, компилятор подставит
    // конкретное значение, т.е. нет никакого overhead в runtime
    print("array len = {}\n", .{arr.len});
}

// про массивы и их адреса
fn foo_ex_arr_ptr(arr: [5]i32) void {
    print("array first element addr in func = 0x{x}\n", .{@intFromPtr(&arr)});
}
fn bar_ex_arr_ptr(arr_ptr: *const [5]i32) void {
    print("array first element addr using arr ptr in func = 0x{x}\n", .{@intFromPtr(&arr_ptr[0])});
}
fn ex_arr_ptr() void {
    print("\nEX_ARR_PTR\n", .{});
    const arr = [_]i32{1,2,3,4,5};
    print("array type = {s}\n", .{@typeName(@TypeOf(arr))});
    // Напечатаются разные адреса!
    // при передачи в функцию массив копируется!!!
    // !!! имя массива != адрес его первого элемента !!!
    print("array first element addr = 0x{x}\n", .{@intFromPtr(&arr)});
    foo_ex_arr_ptr(arr);

    print("---\n", .{});
    // Получение именно АДРЕСА массива
    const arr_ptr = arr[0..arr.len];
    // Напечатаются одинаковые адреса!!!
    print("arr[0..arr.len] type = {s}\n", .{@typeName(@TypeOf(arr_ptr))});
    print("array first element addr using arr ptr = 0x{x}\n", .{@intFromPtr(&arr_ptr[0])});
    bar_ex_arr_ptr(arr_ptr);

    // Разыменование адреса массива
    // в Zig для разыменования указателей используется оператор .*
    print("---\n", .{});
    const dereferenced = arr_ptr.*;
    print("type after dereferenced arr ptr = {s}\n", .{@typeName(@TypeOf(dereferenced))});
    print("array first element addr after deref arr ptr = 0x{x}\n", .{@intFromPtr(&dereferenced)});
}

// про слайсы
// Слайс - это указатель и длина. Разница между массивом и фрагментом
// заключается в том, что длина массива является частью типа и известна 
// во время компиляции, тогда как длина фрагмента известна во время выполнения.
//
// Слайс - структура с двумя полями - указатель на массив и длина массива
fn ex_slice1() void {
    print("\nEX_SLICE_1\n", .{});
    const arr = [_]i32{1,2,3,4,5};
    var end: usize = 3; end += 1; // значение end известно только в runtime
    
    const slice = arr[0..end];
    print("slice type = {s}\n", .{@typeName(@TypeOf(slice))});
    print("slice.ptr = 0x{x}\n", .{@intFromPtr(slice.ptr)});
    print("slice.len = {}\n", .{slice.len});
}

fn ex_slice2() void {
    print("\nEX_SLICE_2\n", .{});
    const slice: []const i32 = &.{1,2,3,4,5};
    print("slice type = {s}\n", .{@typeName(@TypeOf(slice))});
    // тут будет [*]const i32 - указатель на неизвестное кол-во элементов
    print("slice.ptr type = {s}\n", .{@typeName(@TypeOf(slice.ptr))});
    print("slice.ptr = 0x{x}\n", .{@intFromPtr(slice.ptr)});
    print("slice.len = {}\n", .{slice.len});
}

fn ex_slice3() void {
    print("\nEX_SLICE_3\n", .{});
    var arr = [_]i32{1,2,3,4,5};
    var end: usize = 3; end += 1; // значение end известно только в runtime
    
    const slice = arr[0..end];
    print("slice type = {s}\n", .{@typeName(@TypeOf(slice))});
    print("slice.ptr = 0x{x}\n", .{@intFromPtr(slice.ptr)});
    print("slice.len = {}\n", .{slice.len});
}

pub fn main() void {
    ex_arr();
    ex_arr_ptr();
    ex_slice1();
    ex_slice2();
    ex_slice3();
}
