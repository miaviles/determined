Q
Ů
x
Assign
ref"T

value"T

output_ref"T"	
Ttype"
validate_shapebool("
use_lockingbool(
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 

ParseExampleV2

serialized	
names
sparse_keys

dense_keys
ragged_keys
dense_defaults2Tdense
sparse_indices	*
num_sparse
sparse_values2sparse_types
sparse_shapes	*
num_sparse
dense_values2Tdense#
ragged_values2ragged_value_types'
ragged_row_splits2ragged_split_types"
Tdense
list(type)(:
2	"

num_sparseint("%
sparse_types
list(type)(:
2	"+
ragged_value_types
list(type)(:
2	"*
ragged_split_types
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
N
Squeeze

input"T
output"T"	
Ttype"
squeeze_dims	list(int)
 (
@
StaticRegexFullMatch	
input

output
"
patternstring
ö
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
s

VariableV2
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring "serve*2.4.42v2.4.3-115-g64918868e218˛7

global_step/Initializer/zerosConst*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
value	B	 R 
k
global_step
VariableV2*
_class
loc:@global_step*
_output_shapes
: *
dtype0	*
shape: 

global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
_class
loc:@global_step*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
o
input_example_tensorPlaceholder*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
dtype0*
shape:˙˙˙˙˙˙˙˙˙
U
ParseExample/ConstConst*
_output_shapes
: *
dtype0	*
valueB	 
d
!ParseExample/ParseExampleV2/namesConst*
_output_shapes
: *
dtype0*
valueB 
j
'ParseExample/ParseExampleV2/sparse_keysConst*
_output_shapes
: *
dtype0*
valueB 
p
&ParseExample/ParseExampleV2/dense_keysConst*
_output_shapes
:*
dtype0*
valueBBx
j
'ParseExample/ParseExampleV2/ragged_keysConst*
_output_shapes
: *
dtype0*
valueB 

ParseExample/ParseExampleV2ParseExampleV2input_example_tensor!ParseExample/ParseExampleV2/names'ParseExample/ParseExampleV2/sparse_keys&ParseExample/ParseExampleV2/dense_keys'ParseExample/ParseExampleV2/ragged_keysParseExample/Const*
Tdense
2	*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
dense_shapes
: *

num_sparse *
ragged_split_types
 *
ragged_value_types
 *
sparse_types
 
g
input_layer/x/ExpandDims/dimConst*
_output_shapes
: *
dtype0*
valueB :
˙˙˙˙˙˙˙˙˙

input_layer/x/ExpandDims
ExpandDimsParseExample/ParseExampleV2input_layer/x/ExpandDims/dim*
T0	*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
u
input_layer/x/CastCastinput_layer/x/ExpandDims*

DstT0*

SrcT0	*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
U
input_layer/x/ShapeShapeinput_layer/x/Cast*
T0*
_output_shapes
:
k
!input_layer/x/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: 
m
#input_layer/x/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
m
#input_layer/x/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:
ó
input_layer/x/strided_sliceStridedSliceinput_layer/x/Shape!input_layer/x/strided_slice/stack#input_layer/x/strided_slice/stack_1#input_layer/x/strided_slice/stack_2*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask
_
input_layer/x/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :

input_layer/x/Reshape/shapePackinput_layer/x/strided_sliceinput_layer/x/Reshape/shape/1*
N*
T0*
_output_shapes
:

input_layer/x/ReshapeReshapeinput_layer/x/Castinput_layer/x/Reshape/shape*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
_
input_layer/concat/concat_dimConst*
_output_shapes
: *
dtype0*
value	B :
n
input_layer/concat/concatIdentityinput_layer/x/Reshape*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙

!my_dense/kernel/Initializer/zerosConst*"
_class
loc:@my_dense/kernel*
_output_shapes

:*
dtype0*
valueB*    

my_dense/kernel
VariableV2*"
_class
loc:@my_dense/kernel*
_output_shapes

:*
dtype0*
shape
:
Ą
my_dense/kernel/AssignAssignmy_dense/kernel!my_dense/kernel/Initializer/zeros*
T0*"
_class
loc:@my_dense/kernel*
_output_shapes

:
~
my_dense/kernel/readIdentitymy_dense/kernel*
T0*"
_class
loc:@my_dense/kernel*
_output_shapes

:
|
my_dense/MatMulMatMulinput_layer/concat/concatmy_dense/kernel/read*
T0*'
_output_shapes
:˙˙˙˙˙˙˙˙˙
h
SqueezeSqueezemy_dense/MatMul*
T0*#
_output_shapes
:˙˙˙˙˙˙˙˙˙*
squeeze_dims


initNoOp

init_all_tablesNoOp

init_1NoOp
4

group_depsNoOp^init^init_1^init_all_tables
Y
save/filename/inputConst*
_output_shapes
: *
dtype0*
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
_output_shapes
: *
dtype0*
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
_output_shapes
: *
dtype0*
shape: 
{
save/StaticRegexFullMatchStaticRegexFullMatch
save/Const"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*
a
save/Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part
f
save/Const_2Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
|
save/SelectSelectsave/StaticRegexFullMatchsave/Const_1save/Const_2"/device:CPU:**
T0*
_output_shapes
: 
f
save/StringJoin
StringJoin
save/Constsave/Select"/device:CPU:**
N*
_output_shapes
: 
Q
save/num_shardsConst*
_output_shapes
: *
dtype0*
value	B :
k
save/ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 

save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 

save/SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&Bglobal_stepBmy_dense/kernel
v
save/SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B 
˘
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_stepmy_dense/kernel"/device:CPU:0*
dtypes
2	
 
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
 
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
T0*
_output_shapes
:
u
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0

save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 

save/RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*1
value(B&Bglobal_stepBmy_dense/kernel
y
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*
valueBB B 
¤
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
_output_shapes

::*
dtypes
2	
s
save/AssignAssignglobal_stepsave/RestoreV2*
T0	*
_class
loc:@global_step*
_output_shapes
: 

save/Assign_1Assignmy_dense/kernelsave/RestoreV2:1*
T0*"
_class
loc:@my_dense/kernel*
_output_shapes

:
8
save/restore_shardNoOp^save/Assign^save/Assign_1
-
save/restore_allNoOp^save/restore_shard"ą<
save/Const:0save/Identity:0save/restore_all (5 @F8"m
global_step^\
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H"%
saved_model_main_op


group_deps"
trainable_variablesnl
j
my_dense/kernel:0my_dense/kernel/Assignmy_dense/kernel/read:02#my_dense/kernel/Initializer/zeros:08"Ů
	variablesËČ
Z
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0H
j
my_dense/kernel:0my_dense/kernel/Assignmy_dense/kernel/read:02#my_dense/kernel/Initializer/zeros:08*
serving_default{
5
examples)
input_example_tensor:0˙˙˙˙˙˙˙˙˙&
output
	Squeeze:0˙˙˙˙˙˙˙˙˙tensorflow/serving/predict