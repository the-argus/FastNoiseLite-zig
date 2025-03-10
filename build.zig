const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "FastNoiseLite",
        .target = target,
        .optimize = optimize,
    });

    lib.addCSourceFiles(.{
        .files = &.{"FastNoiseLite.c"},
        .flags = &.{"-fno-sanitize=undefined"},
    });
    lib.linkLibC();
    lib.installHeader(b.path("FastNoiseLite.h"), "FastNoiseLite.h");
    b.installArtifact(lib);
}
