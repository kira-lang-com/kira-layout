; ModuleID = "main"
source_filename = "main"
target triple = "arm64-apple-macosx"

%t.LayoutEngine = type {  }
%t.EdgeInsets = type { double, double, double, double }
%t.Rect = type { double, double, double, double }
%t.LayoutTree = type { ptr }
%t.Point = type { double, double }
%t.LayoutDescriptor = type { ptr, ptr, ptr, ptr, double, double, ptr, ptr, i64, %t.EdgeInsets, %t.EdgeInsets, double, double, i64, i8 }
%t.LayoutNode = type { %t.LayoutDescriptor, %t.Size, %t.Point, i64, i64 }
%t.Size = type { double, double }

%kira.string = type { ptr, i64 }

%kira.bridge.value = type { i8, [7 x i8], i64, i64 }

@kira_bool_true_data = private unnamed_addr constant [5 x i8] c"true\00"
@kira_bool_true = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([5 x i8], ptr @kira_bool_true_data, i64 0, i64 0), i64 4 }
@kira_bool_false_data = private unnamed_addr constant [6 x i8] c"false\00"
@kira_bool_false = private unnamed_addr constant %kira.string { ptr getelementptr inbounds ([6 x i8], ptr @kira_bool_false_data, i64 0, i64 0), i64 5 }

declare void @"kira_native_write_i64"(i64)
declare void @"kira_native_write_f64"(double)
declare void @"kira_native_write_string"(ptr, i64)
declare void @"kira_native_write_ptr"(i64)
declare void @"kira_native_write_newline"()
declare void @"kira_native_print_i64"(i64)
declare void @"kira_native_print_f64"(double)
declare void @"kira_native_print_string"(ptr, i64)
declare ptr @"kira_array_alloc"(i64)
declare i64 @"kira_array_len"(ptr)
declare void @"kira_array_store"(ptr, i64, ptr)
declare void @"kira_array_append"(ptr, ptr)
declare void @"kira_array_load"(ptr, i64, ptr)
declare void @"kira_array_release"(ptr, ptr)
declare ptr @"kira_native_state_alloc"(i64, i64)
declare ptr @"kira_native_state_payload"(ptr)
declare ptr @"kira_native_state_recover"(ptr, i64)
declare i64 @strlen(ptr)
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1 immarg)
declare ptr @malloc(i64)
declare void @free(ptr)
declare void @"kira_hybrid_call_runtime"(i32, ptr, i32, ptr)
define void @"kira_destroy_raw_ptr"(ptr %value) {
entry:
  call void @free(ptr %value)
  ret void
}
define void @"kira_release_contents_LayoutEngine"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_LayoutEngine"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_LayoutEngine"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_EdgeInsets"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_EdgeInsets"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_EdgeInsets"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_Rect"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_Rect"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_Rect"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_LayoutTree"(ptr %value) {
entry:
  %release.array.field.0 = getelementptr inbounds %t.LayoutTree, ptr %value, i32 0, i32 0
  %release.array.0 = load ptr, ptr %release.array.field.0
  call void @"kira_array_release"(ptr %release.array.0, ptr @"kira_destroy_LayoutNode")
  ret void
}
define void @"kira_destroy_LayoutTree"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_LayoutTree"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_Point"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_Point"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_Point"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_LayoutDescriptor"(ptr %value) {
entry:
  %release.field.9 = getelementptr inbounds %t.LayoutDescriptor, ptr %value, i32 0, i32 9
  call void @"kira_release_contents_EdgeInsets"(ptr %release.field.9)
  %release.field.10 = getelementptr inbounds %t.LayoutDescriptor, ptr %value, i32 0, i32 10
  call void @"kira_release_contents_EdgeInsets"(ptr %release.field.10)
  ret void
}
define void @"kira_destroy_LayoutDescriptor"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_LayoutDescriptor"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_LayoutNode"(ptr %value) {
entry:
  %release.field.0 = getelementptr inbounds %t.LayoutNode, ptr %value, i32 0, i32 0
  call void @"kira_release_contents_LayoutDescriptor"(ptr %release.field.0)
  %release.field.1 = getelementptr inbounds %t.LayoutNode, ptr %value, i32 0, i32 1
  call void @"kira_release_contents_Size"(ptr %release.field.1)
  %release.field.2 = getelementptr inbounds %t.LayoutNode, ptr %value, i32 0, i32 2
  call void @"kira_release_contents_Point"(ptr %release.field.2)
  ret void
}
define void @"kira_destroy_LayoutNode"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_LayoutNode"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}
define void @"kira_release_contents_Size"(ptr %value) {
entry:
  ret void
}
define void @"kira_destroy_Size"(ptr %value) {
entry:
  %isnull = icmp eq ptr %value, null
  br i1 %isnull, label %done, label %body
body:
  call void @"kira_release_contents_Size"(ptr %value)
  call void @free(ptr %value)
  br label %done
done:
  ret void
}


