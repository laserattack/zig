const expect = @import("std").testing.expect;

test "pointer var" {
    const a: i32 = 42;
    const ptr = &a;
    try expect(ptr.* == 42);
}

test "pointer arithmetic array" {
    const array = [_]i32{ 1, 2, 3 };

    // Coerce to many-item pointer
    var ptr: [*]const i32 = &array;
    try expect(ptr[0] == 1);
    ptr += 2;
    try expect(ptr[0] == 3);
}
