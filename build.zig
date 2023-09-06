const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "FastNoiseLite",
        .target = target,
        .optimize = optimize,
    });

    lib.addCSourceFiles(&.{"FastNoiseLite.h"}, &.{});
    lib.linkLibC();
    lib.installHeader("FastNoiseLite.h", "FastNoiseLite.h");
    b.installArtifact(lib);
}
