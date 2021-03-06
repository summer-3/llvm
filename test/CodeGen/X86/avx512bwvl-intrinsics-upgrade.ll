; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mcpu=knl -mattr=+avx512bw -mattr=+avx512vl --show-mc-encoding| FileCheck %s

declare void @llvm.x86.avx512.mask.storeu.b.128(i8*, <16 x i8>, i16)

define void@test_int_x86_avx512_mask_storeu_b_128(i8* %ptr1, i8* %ptr2, <16 x i8> %x1, i16 %x2) {
; CHECK-LABEL: test_int_x86_avx512_mask_storeu_b_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovw %edx, %k1 ## encoding: [0xc5,0xf8,0x92,0xca]
; CHECK-NEXT:    vmovdqu8 %xmm0, (%rdi) {%k1} ## encoding: [0x62,0xf1,0x7f,0x09,0x7f,0x07]
; CHECK-NEXT:    vmovdqu8 %xmm0, (%rsi) ## encoding: [0x62,0xf1,0x7f,0x08,0x7f,0x06]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  call void @llvm.x86.avx512.mask.storeu.b.128(i8* %ptr1, <16 x i8> %x1, i16 %x2)
  call void @llvm.x86.avx512.mask.storeu.b.128(i8* %ptr2, <16 x i8> %x1, i16 -1)
  ret void
}

declare void @llvm.x86.avx512.mask.storeu.b.256(i8*, <32 x i8>, i32)

define void@test_int_x86_avx512_mask_storeu_b_256(i8* %ptr1, i8* %ptr2, <32 x i8> %x1, i32 %x2) {
; CHECK-LABEL: test_int_x86_avx512_mask_storeu_b_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edx, %k1 ## encoding: [0xc5,0xfb,0x92,0xca]
; CHECK-NEXT:    vmovdqu8 %ymm0, (%rdi) {%k1} ## encoding: [0x62,0xf1,0x7f,0x29,0x7f,0x07]
; CHECK-NEXT:    vmovdqu8 %ymm0, (%rsi) ## encoding: [0x62,0xf1,0x7f,0x28,0x7f,0x06]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  call void @llvm.x86.avx512.mask.storeu.b.256(i8* %ptr1, <32 x i8> %x1, i32 %x2)
  call void @llvm.x86.avx512.mask.storeu.b.256(i8* %ptr2, <32 x i8> %x1, i32 -1)
  ret void
}

declare void @llvm.x86.avx512.mask.storeu.w.128(i8*, <8 x i16>, i8)

define void@test_int_x86_avx512_mask_storeu_w_128(i8* %ptr1, i8* %ptr2, <8 x i16> %x1, i8 %x2) {
; CHECK-LABEL: test_int_x86_avx512_mask_storeu_w_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovw %edx, %k1 ## encoding: [0xc5,0xf8,0x92,0xca]
; CHECK-NEXT:    vmovdqu16 %xmm0, (%rdi) {%k1} ## encoding: [0x62,0xf1,0xff,0x09,0x7f,0x07]
; CHECK-NEXT:    vmovdqu16 %xmm0, (%rsi) ## encoding: [0x62,0xf1,0xff,0x08,0x7f,0x06]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  call void @llvm.x86.avx512.mask.storeu.w.128(i8* %ptr1, <8 x i16> %x1, i8 %x2)
  call void @llvm.x86.avx512.mask.storeu.w.128(i8* %ptr2, <8 x i16> %x1, i8 -1)
  ret void
}

declare void @llvm.x86.avx512.mask.storeu.w.256(i8*, <16 x i16>, i16)

define void@test_int_x86_avx512_mask_storeu_w_256(i8* %ptr1, i8* %ptr2, <16 x i16> %x1, i16 %x2) {
; CHECK-LABEL: test_int_x86_avx512_mask_storeu_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovw %edx, %k1 ## encoding: [0xc5,0xf8,0x92,0xca]
; CHECK-NEXT:    vmovdqu16 %ymm0, (%rdi) {%k1} ## encoding: [0x62,0xf1,0xff,0x29,0x7f,0x07]
; CHECK-NEXT:    vmovdqu16 %ymm0, (%rsi) ## encoding: [0x62,0xf1,0xff,0x28,0x7f,0x06]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  call void @llvm.x86.avx512.mask.storeu.w.256(i8* %ptr1, <16 x i16> %x1, i16 %x2)
  call void @llvm.x86.avx512.mask.storeu.w.256(i8* %ptr2, <16 x i16> %x1, i16 -1)
  ret void
}

declare <8 x i16> @llvm.x86.avx512.mask.loadu.w.128(i8*, <8 x i16>, i8)

define <8 x i16>@test_int_x86_avx512_mask_loadu_w_128(i8* %ptr, i8* %ptr2, <8 x i16> %x1, i8 %mask) {
; CHECK-LABEL: test_int_x86_avx512_mask_loadu_w_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vmovdqu16 (%rdi), %xmm0 ## encoding: [0x62,0xf1,0xff,0x08,0x6f,0x07]
; CHECK-NEXT:    kmovw %edx, %k1 ## encoding: [0xc5,0xf8,0x92,0xca]
; CHECK-NEXT:    vmovdqu16 (%rsi), %xmm0 {%k1} ## encoding: [0x62,0xf1,0xff,0x09,0x6f,0x06]
; CHECK-NEXT:    vmovdqu16 (%rdi), %xmm1 {%k1} {z} ## encoding: [0x62,0xf1,0xff,0x89,0x6f,0x0f]
; CHECK-NEXT:    vpaddw %xmm1, %xmm0, %xmm0 ## encoding: [0x62,0xf1,0x7d,0x08,0xfd,0xc1]
; CHECK-NEXT:    retq ## encoding: [0xc3]
    %res0 = call <8 x i16> @llvm.x86.avx512.mask.loadu.w.128(i8* %ptr, <8 x i16> %x1, i8 -1)
    %res = call <8 x i16> @llvm.x86.avx512.mask.loadu.w.128(i8* %ptr2, <8 x i16> %res0, i8 %mask)
    %res1 = call <8 x i16> @llvm.x86.avx512.mask.loadu.w.128(i8* %ptr, <8 x i16> zeroinitializer, i8 %mask)
    %res2 = add <8 x i16> %res, %res1
    ret <8 x i16> %res2
}

declare <16 x i16> @llvm.x86.avx512.mask.loadu.w.256(i8*, <16 x i16>, i16)

define <16 x i16>@test_int_x86_avx512_mask_loadu_w_256(i8* %ptr, i8* %ptr2, <16 x i16> %x1, i16 %mask) {
; CHECK-LABEL: test_int_x86_avx512_mask_loadu_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vmovdqu16 (%rdi), %ymm0 ## encoding: [0x62,0xf1,0xff,0x28,0x6f,0x07]
; CHECK-NEXT:    kmovw %edx, %k1 ## encoding: [0xc5,0xf8,0x92,0xca]
; CHECK-NEXT:    vmovdqu16 (%rsi), %ymm0 {%k1} ## encoding: [0x62,0xf1,0xff,0x29,0x6f,0x06]
; CHECK-NEXT:    vmovdqu16 (%rdi), %ymm1 {%k1} {z} ## encoding: [0x62,0xf1,0xff,0xa9,0x6f,0x0f]
; CHECK-NEXT:    vpaddw %ymm1, %ymm0, %ymm0 ## encoding: [0x62,0xf1,0x7d,0x28,0xfd,0xc1]
; CHECK-NEXT:    retq ## encoding: [0xc3]
    %res0 = call <16 x i16> @llvm.x86.avx512.mask.loadu.w.256(i8* %ptr, <16 x i16> %x1, i16 -1)
    %res = call <16 x i16> @llvm.x86.avx512.mask.loadu.w.256(i8* %ptr2, <16 x i16> %res0, i16 %mask)
    %res1 = call <16 x i16> @llvm.x86.avx512.mask.loadu.w.256(i8* %ptr, <16 x i16> zeroinitializer, i16 %mask)
    %res2 = add <16 x i16> %res, %res1
    ret <16 x i16> %res2
}

declare <16 x i8> @llvm.x86.avx512.mask.loadu.b.128(i8*, <16 x i8>, i16)

define <16 x i8>@test_int_x86_avx512_mask_loadu_b_128(i8* %ptr, i8* %ptr2, <16 x i8> %x1, i16 %mask) {
; CHECK-LABEL: test_int_x86_avx512_mask_loadu_b_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vmovdqu8 (%rdi), %xmm0 ## encoding: [0x62,0xf1,0x7f,0x08,0x6f,0x07]
; CHECK-NEXT:    kmovw %edx, %k1 ## encoding: [0xc5,0xf8,0x92,0xca]
; CHECK-NEXT:    vmovdqu8 (%rsi), %xmm0 {%k1} ## encoding: [0x62,0xf1,0x7f,0x09,0x6f,0x06]
; CHECK-NEXT:    vmovdqu8 (%rdi), %xmm1 {%k1} {z} ## encoding: [0x62,0xf1,0x7f,0x89,0x6f,0x0f]
; CHECK-NEXT:    vpaddb %xmm1, %xmm0, %xmm0 ## encoding: [0x62,0xf1,0x7d,0x08,0xfc,0xc1]
; CHECK-NEXT:    retq ## encoding: [0xc3]
    %res0 = call <16 x i8> @llvm.x86.avx512.mask.loadu.b.128(i8* %ptr, <16 x i8> %x1, i16 -1)
    %res = call <16 x i8> @llvm.x86.avx512.mask.loadu.b.128(i8* %ptr2, <16 x i8> %res0, i16 %mask)
    %res1 = call <16 x i8> @llvm.x86.avx512.mask.loadu.b.128(i8* %ptr, <16 x i8> zeroinitializer, i16 %mask)
    %res2 = add <16 x i8> %res, %res1
    ret <16 x i8> %res2
}

declare <32 x i8> @llvm.x86.avx512.mask.loadu.b.256(i8*, <32 x i8>, i32)

define <32 x i8>@test_int_x86_avx512_mask_loadu_b_256(i8* %ptr, i8* %ptr2, <32 x i8> %x1, i32 %mask) {
; CHECK-LABEL: test_int_x86_avx512_mask_loadu_b_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vmovdqu8 (%rdi), %ymm0 ## encoding: [0x62,0xf1,0x7f,0x28,0x6f,0x07]
; CHECK-NEXT:    kmovd %edx, %k1 ## encoding: [0xc5,0xfb,0x92,0xca]
; CHECK-NEXT:    vmovdqu8 (%rsi), %ymm0 {%k1} ## encoding: [0x62,0xf1,0x7f,0x29,0x6f,0x06]
; CHECK-NEXT:    vmovdqu8 (%rdi), %ymm1 {%k1} {z} ## encoding: [0x62,0xf1,0x7f,0xa9,0x6f,0x0f]
; CHECK-NEXT:    vpaddb %ymm1, %ymm0, %ymm0 ## encoding: [0x62,0xf1,0x7d,0x28,0xfc,0xc1]
; CHECK-NEXT:    retq ## encoding: [0xc3]
    %res0 = call <32 x i8> @llvm.x86.avx512.mask.loadu.b.256(i8* %ptr, <32 x i8> %x1, i32 -1)
    %res = call <32 x i8> @llvm.x86.avx512.mask.loadu.b.256(i8* %ptr2, <32 x i8> %res0, i32 %mask)
    %res1 = call <32 x i8> @llvm.x86.avx512.mask.loadu.b.256(i8* %ptr, <32 x i8> zeroinitializer, i32 %mask)
    %res2 = add <32 x i8> %res, %res1
    ret <32 x i8> %res2
}

declare <16 x i8> @llvm.x86.avx512.mask.palignr.128(<16 x i8>, <16 x i8>, i32, <16 x i8>, i16)

define <16 x i8>@test_int_x86_avx512_mask_palignr_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x3, i16 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_palignr_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpalignr $2, %xmm1, %xmm0, %xmm3 ## encoding: [0x62,0xf3,0x7d,0x08,0x0f,0xd9,0x02]
; CHECK-NEXT:    ## xmm3 = xmm1[2,3,4,5,6,7,8,9,10,11,12,13,14,15],xmm0[0,1]
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpalignr $2, %xmm1, %xmm0, %xmm2 {%k1} ## encoding: [0x62,0xf3,0x7d,0x09,0x0f,0xd1,0x02]
; CHECK-NEXT:    ## xmm2 {%k1} = xmm1[2,3,4,5,6,7,8,9,10,11,12,13,14,15],xmm0[0,1]
; CHECK-NEXT:    vpalignr $2, %xmm1, %xmm0, %xmm0 {%k1} {z} ## encoding: [0x62,0xf3,0x7d,0x89,0x0f,0xc1,0x02]
; CHECK-NEXT:    ## xmm0 {%k1} {z} = xmm1[2,3,4,5,6,7,8,9,10,11,12,13,14,15],xmm0[0,1]
; CHECK-NEXT:    vpaddb %xmm0, %xmm2, %xmm0 ## encoding: [0x62,0xf1,0x6d,0x08,0xfc,0xc0]
; CHECK-NEXT:    vpaddb %xmm3, %xmm0, %xmm0 ## encoding: [0x62,0xf1,0x7d,0x08,0xfc,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.avx512.mask.palignr.128(<16 x i8> %x0, <16 x i8> %x1, i32 2, <16 x i8> %x3, i16 %x4)
  %res1 = call <16 x i8> @llvm.x86.avx512.mask.palignr.128(<16 x i8> %x0, <16 x i8> %x1, i32 2, <16 x i8> zeroinitializer, i16 %x4)
  %res2 = call <16 x i8> @llvm.x86.avx512.mask.palignr.128(<16 x i8> %x0, <16 x i8> %x1, i32 2, <16 x i8> %x3, i16 -1)
  %res3 = add <16 x i8> %res, %res1
  %res4 = add <16 x i8> %res3, %res2
  ret <16 x i8> %res4
}

declare <32 x i8> @llvm.x86.avx512.mask.palignr.256(<32 x i8>, <32 x i8>, i32, <32 x i8>, i32)

define <32 x i8>@test_int_x86_avx512_mask_palignr_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x3, i32 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_palignr_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpalignr $2, %ymm1, %ymm0, %ymm3 ## encoding: [0x62,0xf3,0x7d,0x28,0x0f,0xd9,0x02]
; CHECK-NEXT:    ## ymm3 = ymm1[2,3,4,5,6,7,8,9,10,11,12,13,14,15],ymm0[0,1],ymm1[18,19,20,21,22,23,24,25,26,27,28,29,30,31],ymm0[16,17]
; CHECK-NEXT:    kmovd %edi, %k1 ## encoding: [0xc5,0xfb,0x92,0xcf]
; CHECK-NEXT:    vpalignr $2, %ymm1, %ymm0, %ymm2 {%k1} ## encoding: [0x62,0xf3,0x7d,0x29,0x0f,0xd1,0x02]
; CHECK-NEXT:    ## ymm2 {%k1} = ymm1[2,3,4,5,6,7,8,9,10,11,12,13,14,15],ymm0[0,1],ymm1[18,19,20,21,22,23,24,25,26,27,28,29,30,31],ymm0[16,17]
; CHECK-NEXT:    vpalignr $2, %ymm1, %ymm0, %ymm0 {%k1} {z} ## encoding: [0x62,0xf3,0x7d,0xa9,0x0f,0xc1,0x02]
; CHECK-NEXT:    ## ymm0 {%k1} {z} = ymm1[2,3,4,5,6,7,8,9,10,11,12,13,14,15],ymm0[0,1],ymm1[18,19,20,21,22,23,24,25,26,27,28,29,30,31],ymm0[16,17]
; CHECK-NEXT:    vpaddb %ymm0, %ymm2, %ymm0 ## encoding: [0x62,0xf1,0x6d,0x28,0xfc,0xc0]
; CHECK-NEXT:    vpaddb %ymm3, %ymm0, %ymm0 ## encoding: [0x62,0xf1,0x7d,0x28,0xfc,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <32 x i8> @llvm.x86.avx512.mask.palignr.256(<32 x i8> %x0, <32 x i8> %x1, i32 2, <32 x i8> %x3, i32 %x4)
  %res1 = call <32 x i8> @llvm.x86.avx512.mask.palignr.256(<32 x i8> %x0, <32 x i8> %x1, i32 2, <32 x i8> zeroinitializer, i32 %x4)
  %res2 = call <32 x i8> @llvm.x86.avx512.mask.palignr.256(<32 x i8> %x0, <32 x i8> %x1, i32 2, <32 x i8> %x3, i32 -1)
  %res3 = add <32 x i8> %res, %res1
  %res4 = add <32 x i8> %res3, %res2
  ret <32 x i8> %res4
}

declare <8 x i16> @llvm.x86.avx512.mask.pshufh.w.128(<8 x i16>, i32, <8 x i16>, i8)

define <8 x i16>@test_int_x86_avx512_mask_pshufh_w_128(<8 x i16> %x0, i32 %x1, <8 x i16> %x2, i8 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_pshufh_w_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpshufhw $3, %xmm0, %xmm2 ## encoding: [0x62,0xf1,0x7e,0x08,0x70,0xd0,0x03]
; CHECK-NEXT:    ## xmm2 = xmm0[0,1,2,3,7,4,4,4]
; CHECK-NEXT:    kmovw %esi, %k1 ## encoding: [0xc5,0xf8,0x92,0xce]
; CHECK-NEXT:    vpshufhw $3, %xmm0, %xmm1 {%k1} ## encoding: [0x62,0xf1,0x7e,0x09,0x70,0xc8,0x03]
; CHECK-NEXT:    ## xmm1 {%k1} = xmm0[0,1,2,3,7,4,4,4]
; CHECK-NEXT:    vpshufhw $3, %xmm0, %xmm0 {%k1} {z} ## encoding: [0x62,0xf1,0x7e,0x89,0x70,0xc0,0x03]
; CHECK-NEXT:    ## xmm0 {%k1} {z} = xmm0[0,1,2,3,7,4,4,4]
; CHECK-NEXT:    vpaddw %xmm0, %xmm1, %xmm0 ## encoding: [0x62,0xf1,0x75,0x08,0xfd,0xc0]
; CHECK-NEXT:    vpaddw %xmm2, %xmm0, %xmm0 ## encoding: [0x62,0xf1,0x7d,0x08,0xfd,0xc2]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.pshufh.w.128(<8 x i16> %x0, i32 3, <8 x i16> %x2, i8 %x3)
  %res1 = call <8 x i16> @llvm.x86.avx512.mask.pshufh.w.128(<8 x i16> %x0, i32 3, <8 x i16> zeroinitializer, i8 %x3)
  %res2 = call <8 x i16> @llvm.x86.avx512.mask.pshufh.w.128(<8 x i16> %x0, i32 3, <8 x i16> %x2, i8 -1)
  %res3 = add <8 x i16> %res, %res1
  %res4 = add <8 x i16> %res3, %res2
  ret <8 x i16> %res4
}

declare <16 x i16> @llvm.x86.avx512.mask.pshufh.w.256(<16 x i16>, i32, <16 x i16>, i16)

define <16 x i16>@test_int_x86_avx512_mask_pshufh_w_256(<16 x i16> %x0, i32 %x1, <16 x i16> %x2, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_pshufh_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpshufhw $3, %ymm0, %ymm2 ## encoding: [0x62,0xf1,0x7e,0x28,0x70,0xd0,0x03]
; CHECK-NEXT:    ## ymm2 = ymm0[0,1,2,3,7,4,4,4,8,9,10,11,15,12,12,12]
; CHECK-NEXT:    kmovw %esi, %k1 ## encoding: [0xc5,0xf8,0x92,0xce]
; CHECK-NEXT:    vpshufhw $3, %ymm0, %ymm1 {%k1} ## encoding: [0x62,0xf1,0x7e,0x29,0x70,0xc8,0x03]
; CHECK-NEXT:    ## ymm1 {%k1} = ymm0[0,1,2,3,7,4,4,4,8,9,10,11,15,12,12,12]
; CHECK-NEXT:    vpshufhw $3, %ymm0, %ymm0 {%k1} {z} ## encoding: [0x62,0xf1,0x7e,0xa9,0x70,0xc0,0x03]
; CHECK-NEXT:    ## ymm0 {%k1} {z} = ymm0[0,1,2,3,7,4,4,4,8,9,10,11,15,12,12,12]
; CHECK-NEXT:    vpaddw %ymm0, %ymm1, %ymm0 ## encoding: [0x62,0xf1,0x75,0x28,0xfd,0xc0]
; CHECK-NEXT:    vpaddw %ymm2, %ymm0, %ymm0 ## encoding: [0x62,0xf1,0x7d,0x28,0xfd,0xc2]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.pshufh.w.256(<16 x i16> %x0, i32 3, <16 x i16> %x2, i16 %x3)
  %res1 = call <16 x i16> @llvm.x86.avx512.mask.pshufh.w.256(<16 x i16> %x0, i32 3, <16 x i16> zeroinitializer, i16 %x3)
  %res2 = call <16 x i16> @llvm.x86.avx512.mask.pshufh.w.256(<16 x i16> %x0, i32 3, <16 x i16> %x2, i16 -1)
  %res3 = add <16 x i16> %res, %res1
  %res4 = add <16 x i16> %res3, %res2
  ret <16 x i16> %res4
}

declare <8 x i16> @llvm.x86.avx512.mask.pshufl.w.128(<8 x i16>, i32, <8 x i16>, i8)

define <8 x i16>@test_int_x86_avx512_mask_pshufl_w_128(<8 x i16> %x0, i32 %x1, <8 x i16> %x2, i8 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_pshufl_w_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpshuflw $3, %xmm0, %xmm2 ## encoding: [0x62,0xf1,0x7f,0x08,0x70,0xd0,0x03]
; CHECK-NEXT:    ## xmm2 = xmm0[3,0,0,0,4,5,6,7]
; CHECK-NEXT:    kmovw %esi, %k1 ## encoding: [0xc5,0xf8,0x92,0xce]
; CHECK-NEXT:    vpshuflw $3, %xmm0, %xmm1 {%k1} ## encoding: [0x62,0xf1,0x7f,0x09,0x70,0xc8,0x03]
; CHECK-NEXT:    ## xmm1 {%k1} = xmm0[3,0,0,0,4,5,6,7]
; CHECK-NEXT:    vpshuflw $3, %xmm0, %xmm0 {%k1} {z} ## encoding: [0x62,0xf1,0x7f,0x89,0x70,0xc0,0x03]
; CHECK-NEXT:    ## xmm0 {%k1} {z} = xmm0[3,0,0,0,4,5,6,7]
; CHECK-NEXT:    vpaddw %xmm0, %xmm1, %xmm0 ## encoding: [0x62,0xf1,0x75,0x08,0xfd,0xc0]
; CHECK-NEXT:    vpaddw %xmm2, %xmm0, %xmm0 ## encoding: [0x62,0xf1,0x7d,0x08,0xfd,0xc2]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.pshufl.w.128(<8 x i16> %x0, i32 3, <8 x i16> %x2, i8 %x3)
  %res1 = call <8 x i16> @llvm.x86.avx512.mask.pshufl.w.128(<8 x i16> %x0, i32 3, <8 x i16> zeroinitializer, i8 %x3)
  %res2 = call <8 x i16> @llvm.x86.avx512.mask.pshufl.w.128(<8 x i16> %x0, i32 3, <8 x i16> %x2, i8 -1)
  %res3 = add <8 x i16> %res, %res1
  %res4 = add <8 x i16> %res3, %res2
  ret <8 x i16> %res4
}

declare <16 x i16> @llvm.x86.avx512.mask.pshufl.w.256(<16 x i16>, i32, <16 x i16>, i16)

define <16 x i16>@test_int_x86_avx512_mask_pshufl_w_256(<16 x i16> %x0, i32 %x1, <16 x i16> %x2, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_pshufl_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpshuflw $3, %ymm0, %ymm2 ## encoding: [0x62,0xf1,0x7f,0x28,0x70,0xd0,0x03]
; CHECK-NEXT:    ## ymm2 = ymm0[3,0,0,0,4,5,6,7,11,8,8,8,12,13,14,15]
; CHECK-NEXT:    kmovw %esi, %k1 ## encoding: [0xc5,0xf8,0x92,0xce]
; CHECK-NEXT:    vpshuflw $3, %ymm0, %ymm1 {%k1} ## encoding: [0x62,0xf1,0x7f,0x29,0x70,0xc8,0x03]
; CHECK-NEXT:    ## ymm1 {%k1} = ymm0[3,0,0,0,4,5,6,7,11,8,8,8,12,13,14,15]
; CHECK-NEXT:    vpshuflw $3, %ymm0, %ymm0 {%k1} {z} ## encoding: [0x62,0xf1,0x7f,0xa9,0x70,0xc0,0x03]
; CHECK-NEXT:    ## ymm0 {%k1} {z} = ymm0[3,0,0,0,4,5,6,7,11,8,8,8,12,13,14,15]
; CHECK-NEXT:    vpaddw %ymm0, %ymm1, %ymm0 ## encoding: [0x62,0xf1,0x75,0x28,0xfd,0xc0]
; CHECK-NEXT:    vpaddw %ymm2, %ymm0, %ymm0 ## encoding: [0x62,0xf1,0x7d,0x28,0xfd,0xc2]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.pshufl.w.256(<16 x i16> %x0, i32 3, <16 x i16> %x2, i16 %x3)
  %res1 = call <16 x i16> @llvm.x86.avx512.mask.pshufl.w.256(<16 x i16> %x0, i32 3, <16 x i16> zeroinitializer, i16 %x3)
  %res2 = call <16 x i16> @llvm.x86.avx512.mask.pshufl.w.256(<16 x i16> %x0, i32 3, <16 x i16> %x2, i16 -1)
  %res3 = add <16 x i16> %res, %res1
  %res4 = add <16 x i16> %res3, %res2
  ret <16 x i16> %res4
}

define i32 @test_pcmpeq_b_256(<32 x i8> %a, <32 x i8> %b) {
; CHECK-LABEL: test_pcmpeq_b_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpcmpeqb %ymm1, %ymm0, %k0 ## encoding: [0x62,0xf1,0x7d,0x28,0x74,0xc1]
; CHECK-NEXT:    kmovd %k0, %eax ## encoding: [0xc5,0xfb,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i32 @llvm.x86.avx512.mask.pcmpeq.b.256(<32 x i8> %a, <32 x i8> %b, i32 -1)
  ret i32 %res
}

define i32 @test_mask_pcmpeq_b_256(<32 x i8> %a, <32 x i8> %b, i32 %mask) {
; CHECK-LABEL: test_mask_pcmpeq_b_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1 ## encoding: [0xc5,0xfb,0x92,0xcf]
; CHECK-NEXT:    vpcmpeqb %ymm1, %ymm0, %k0 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x74,0xc1]
; CHECK-NEXT:    kmovd %k0, %eax ## encoding: [0xc5,0xfb,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i32 @llvm.x86.avx512.mask.pcmpeq.b.256(<32 x i8> %a, <32 x i8> %b, i32 %mask)
  ret i32 %res
}

declare i32 @llvm.x86.avx512.mask.pcmpeq.b.256(<32 x i8>, <32 x i8>, i32)

define i16 @test_pcmpeq_w_256(<16 x i16> %a, <16 x i16> %b) {
; CHECK-LABEL: test_pcmpeq_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpcmpeqw %ymm1, %ymm0, %k0 ## encoding: [0x62,0xf1,0x7d,0x28,0x75,0xc1]
; CHECK-NEXT:    kmovw %k0, %eax ## encoding: [0xc5,0xf8,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i16 @llvm.x86.avx512.mask.pcmpeq.w.256(<16 x i16> %a, <16 x i16> %b, i16 -1)
  ret i16 %res
}

define i16 @test_mask_pcmpeq_w_256(<16 x i16> %a, <16 x i16> %b, i16 %mask) {
; CHECK-LABEL: test_mask_pcmpeq_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpcmpeqw %ymm1, %ymm0, %k0 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x75,0xc1]
; CHECK-NEXT:    kmovw %k0, %eax ## encoding: [0xc5,0xf8,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i16 @llvm.x86.avx512.mask.pcmpeq.w.256(<16 x i16> %a, <16 x i16> %b, i16 %mask)
  ret i16 %res
}

declare i16 @llvm.x86.avx512.mask.pcmpeq.w.256(<16 x i16>, <16 x i16>, i16)

define i32 @test_pcmpgt_b_256(<32 x i8> %a, <32 x i8> %b) {
; CHECK-LABEL: test_pcmpgt_b_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpcmpgtb %ymm1, %ymm0, %k0 ## encoding: [0x62,0xf1,0x7d,0x28,0x64,0xc1]
; CHECK-NEXT:    kmovd %k0, %eax ## encoding: [0xc5,0xfb,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i32 @llvm.x86.avx512.mask.pcmpgt.b.256(<32 x i8> %a, <32 x i8> %b, i32 -1)
  ret i32 %res
}

define i32 @test_mask_pcmpgt_b_256(<32 x i8> %a, <32 x i8> %b, i32 %mask) {
; CHECK-LABEL: test_mask_pcmpgt_b_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1 ## encoding: [0xc5,0xfb,0x92,0xcf]
; CHECK-NEXT:    vpcmpgtb %ymm1, %ymm0, %k0 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x64,0xc1]
; CHECK-NEXT:    kmovd %k0, %eax ## encoding: [0xc5,0xfb,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i32 @llvm.x86.avx512.mask.pcmpgt.b.256(<32 x i8> %a, <32 x i8> %b, i32 %mask)
  ret i32 %res
}

declare i32 @llvm.x86.avx512.mask.pcmpgt.b.256(<32 x i8>, <32 x i8>, i32)

define i16 @test_pcmpgt_w_256(<16 x i16> %a, <16 x i16> %b) {
; CHECK-LABEL: test_pcmpgt_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpcmpgtw %ymm1, %ymm0, %k0 ## encoding: [0x62,0xf1,0x7d,0x28,0x65,0xc1]
; CHECK-NEXT:    kmovw %k0, %eax ## encoding: [0xc5,0xf8,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i16 @llvm.x86.avx512.mask.pcmpgt.w.256(<16 x i16> %a, <16 x i16> %b, i16 -1)
  ret i16 %res
}

define i16 @test_mask_pcmpgt_w_256(<16 x i16> %a, <16 x i16> %b, i16 %mask) {
; CHECK-LABEL: test_mask_pcmpgt_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpcmpgtw %ymm1, %ymm0, %k0 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x65,0xc1]
; CHECK-NEXT:    kmovw %k0, %eax ## encoding: [0xc5,0xf8,0x93,0xc0]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call i16 @llvm.x86.avx512.mask.pcmpgt.w.256(<16 x i16> %a, <16 x i16> %b, i16 %mask)
  ret i16 %res
}

declare i16 @llvm.x86.avx512.mask.pcmpgt.w.256(<16 x i16>, <16 x i16>, i16)

declare <16 x i8> @llvm.x86.avx512.mask.punpckhb.w.128(<16 x i8>, <16 x i8>, <16 x i8>, i16)

define <16 x i8>@test_int_x86_avx512_mask_punpckhb_w_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpckhb_w_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpckhbw %xmm1, %xmm0, %xmm3 ## encoding: [0x62,0xf1,0x7d,0x08,0x68,0xd9]
; CHECK-NEXT:    ## xmm3 = xmm0[8],xmm1[8],xmm0[9],xmm1[9],xmm0[10],xmm1[10],xmm0[11],xmm1[11],xmm0[12],xmm1[12],xmm0[13],xmm1[13],xmm0[14],xmm1[14],xmm0[15],xmm1[15]
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpunpckhbw %xmm1, %xmm0, %xmm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x09,0x68,0xd1]
; CHECK-NEXT:    ## xmm2 {%k1} = xmm0[8],xmm1[8],xmm0[9],xmm1[9],xmm0[10],xmm1[10],xmm0[11],xmm1[11],xmm0[12],xmm1[12],xmm0[13],xmm1[13],xmm0[14],xmm1[14],xmm0[15],xmm1[15]
; CHECK-NEXT:    vpaddb %xmm3, %xmm2, %xmm0 ## encoding: [0x62,0xf1,0x6d,0x08,0xfc,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.avx512.mask.punpckhb.w.128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3)
  %res1 = call <16 x i8> @llvm.x86.avx512.mask.punpckhb.w.128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 -1)
  %res2 = add <16 x i8> %res, %res1
  ret <16 x i8> %res2
}

declare <16 x i8> @llvm.x86.avx512.mask.punpcklb.w.128(<16 x i8>, <16 x i8>, <16 x i8>, i16)

define <16 x i8>@test_int_x86_avx512_mask_punpcklb_w_128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpcklb_w_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpcklbw %xmm1, %xmm0, %xmm3 ## encoding: [0x62,0xf1,0x7d,0x08,0x60,0xd9]
; CHECK-NEXT:    ## xmm3 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3],xmm0[4],xmm1[4],xmm0[5],xmm1[5],xmm0[6],xmm1[6],xmm0[7],xmm1[7]
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpunpcklbw %xmm1, %xmm0, %xmm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x09,0x60,0xd1]
; CHECK-NEXT:    ## xmm2 {%k1} = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3],xmm0[4],xmm1[4],xmm0[5],xmm1[5],xmm0[6],xmm1[6],xmm0[7],xmm1[7]
; CHECK-NEXT:    vpaddb %xmm3, %xmm2, %xmm0 ## encoding: [0x62,0xf1,0x6d,0x08,0xfc,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.avx512.mask.punpcklb.w.128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 %x3)
  %res1 = call <16 x i8> @llvm.x86.avx512.mask.punpcklb.w.128(<16 x i8> %x0, <16 x i8> %x1, <16 x i8> %x2, i16 -1)
  %res2 = add <16 x i8> %res, %res1
  ret <16 x i8> %res2
}

declare <32 x i8> @llvm.x86.avx512.mask.punpckhb.w.256(<32 x i8>, <32 x i8>, <32 x i8>, i32)

define <32 x i8>@test_int_x86_avx512_mask_punpckhb_w_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpckhb_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpckhbw %ymm1, %ymm0, %ymm3 ## encoding: [0x62,0xf1,0x7d,0x28,0x68,0xd9]
; CHECK-NEXT:    ## ymm3 = ymm0[8],ymm1[8],ymm0[9],ymm1[9],ymm0[10],ymm1[10],ymm0[11],ymm1[11],ymm0[12],ymm1[12],ymm0[13],ymm1[13],ymm0[14],ymm1[14],ymm0[15],ymm1[15],ymm0[24],ymm1[24],ymm0[25],ymm1[25],ymm0[26],ymm1[26],ymm0[27],ymm1[27],ymm0[28],ymm1[28],ymm0[29],ymm1[29],ymm0[30],ymm1[30],ymm0[31],ymm1[31]
; CHECK-NEXT:    kmovd %edi, %k1 ## encoding: [0xc5,0xfb,0x92,0xcf]
; CHECK-NEXT:    vpunpckhbw %ymm1, %ymm0, %ymm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x68,0xd1]
; CHECK-NEXT:    ## ymm2 {%k1} = ymm0[8],ymm1[8],ymm0[9],ymm1[9],ymm0[10],ymm1[10],ymm0[11],ymm1[11],ymm0[12],ymm1[12],ymm0[13],ymm1[13],ymm0[14],ymm1[14],ymm0[15],ymm1[15],ymm0[24],ymm1[24],ymm0[25],ymm1[25],ymm0[26],ymm1[26],ymm0[27],ymm1[27],ymm0[28],ymm1[28],ymm0[29],ymm1[29],ymm0[30],ymm1[30],ymm0[31],ymm1[31]
; CHECK-NEXT:    vpaddb %ymm3, %ymm2, %ymm0 ## encoding: [0x62,0xf1,0x6d,0x28,0xfc,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <32 x i8> @llvm.x86.avx512.mask.punpckhb.w.256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3)
  %res1 = call <32 x i8> @llvm.x86.avx512.mask.punpckhb.w.256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 -1)
  %res2 = add <32 x i8> %res, %res1
  ret <32 x i8> %res2
}

declare <32 x i8> @llvm.x86.avx512.mask.punpcklb.w.256(<32 x i8>, <32 x i8>, <32 x i8>, i32)

define <32 x i8>@test_int_x86_avx512_mask_punpcklb_w_256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpcklb_w_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpcklbw %ymm1, %ymm0, %ymm3 ## encoding: [0x62,0xf1,0x7d,0x28,0x60,0xd9]
; CHECK-NEXT:    ## ymm3 = ymm0[0],ymm1[0],ymm0[1],ymm1[1],ymm0[2],ymm1[2],ymm0[3],ymm1[3],ymm0[4],ymm1[4],ymm0[5],ymm1[5],ymm0[6],ymm1[6],ymm0[7],ymm1[7],ymm0[16],ymm1[16],ymm0[17],ymm1[17],ymm0[18],ymm1[18],ymm0[19],ymm1[19],ymm0[20],ymm1[20],ymm0[21],ymm1[21],ymm0[22],ymm1[22],ymm0[23],ymm1[23]
; CHECK-NEXT:    kmovd %edi, %k1 ## encoding: [0xc5,0xfb,0x92,0xcf]
; CHECK-NEXT:    vpunpcklbw %ymm1, %ymm0, %ymm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x60,0xd1]
; CHECK-NEXT:    ## ymm2 {%k1} = ymm0[0],ymm1[0],ymm0[1],ymm1[1],ymm0[2],ymm1[2],ymm0[3],ymm1[3],ymm0[4],ymm1[4],ymm0[5],ymm1[5],ymm0[6],ymm1[6],ymm0[7],ymm1[7],ymm0[16],ymm1[16],ymm0[17],ymm1[17],ymm0[18],ymm1[18],ymm0[19],ymm1[19],ymm0[20],ymm1[20],ymm0[21],ymm1[21],ymm0[22],ymm1[22],ymm0[23],ymm1[23]
; CHECK-NEXT:    vpaddb %ymm3, %ymm2, %ymm0 ## encoding: [0x62,0xf1,0x6d,0x28,0xfc,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <32 x i8> @llvm.x86.avx512.mask.punpcklb.w.256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 %x3)
  %res1 = call <32 x i8> @llvm.x86.avx512.mask.punpcklb.w.256(<32 x i8> %x0, <32 x i8> %x1, <32 x i8> %x2, i32 -1)
  %res2 = add <32 x i8> %res, %res1
  ret <32 x i8> %res2
}

declare <8 x i16> @llvm.x86.avx512.mask.punpcklw.d.128(<8 x i16>, <8 x i16>, <8 x i16>, i8)

define <8 x i16>@test_int_x86_avx512_mask_punpcklw_d_128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x2, i8 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpcklw_d_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpcklwd %xmm1, %xmm0, %xmm3 ## encoding: [0x62,0xf1,0x7d,0x08,0x61,0xd9]
; CHECK-NEXT:    ## xmm3 = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpunpcklwd %xmm1, %xmm0, %xmm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x09,0x61,0xd1]
; CHECK-NEXT:    ## xmm2 {%k1} = xmm0[0],xmm1[0],xmm0[1],xmm1[1],xmm0[2],xmm1[2],xmm0[3],xmm1[3]
; CHECK-NEXT:    vpaddw %xmm3, %xmm2, %xmm0 ## encoding: [0x62,0xf1,0x6d,0x08,0xfd,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.punpcklw.d.128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x2, i8 %x3)
  %res1 = call <8 x i16> @llvm.x86.avx512.mask.punpcklw.d.128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x2, i8 -1)
  %res2 = add <8 x i16> %res, %res1
  ret <8 x i16> %res2
}

declare <8 x i16> @llvm.x86.avx512.mask.punpckhw.d.128(<8 x i16>, <8 x i16>, <8 x i16>, i8)

define <8 x i16>@test_int_x86_avx512_mask_punpckhw_d_128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x2, i8 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpckhw_d_128:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpckhwd %xmm1, %xmm0, %xmm3 ## encoding: [0x62,0xf1,0x7d,0x08,0x69,0xd9]
; CHECK-NEXT:    ## xmm3 = xmm0[4],xmm1[4],xmm0[5],xmm1[5],xmm0[6],xmm1[6],xmm0[7],xmm1[7]
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpunpckhwd %xmm1, %xmm0, %xmm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x09,0x69,0xd1]
; CHECK-NEXT:    ## xmm2 {%k1} = xmm0[4],xmm1[4],xmm0[5],xmm1[5],xmm0[6],xmm1[6],xmm0[7],xmm1[7]
; CHECK-NEXT:    vpaddw %xmm3, %xmm2, %xmm0 ## encoding: [0x62,0xf1,0x6d,0x08,0xfd,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.punpckhw.d.128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x2, i8 %x3)
  %res1 = call <8 x i16> @llvm.x86.avx512.mask.punpckhw.d.128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x2, i8 -1)
  %res2 = add <8 x i16> %res, %res1
  ret <8 x i16> %res2
}

declare <16 x i16> @llvm.x86.avx512.mask.punpcklw.d.256(<16 x i16>, <16 x i16>, <16 x i16>, i16)

define <16 x i16>@test_int_x86_avx512_mask_punpcklw_d_256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x2, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpcklw_d_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpcklwd %ymm1, %ymm0, %ymm3 ## encoding: [0x62,0xf1,0x7d,0x28,0x61,0xd9]
; CHECK-NEXT:    ## ymm3 = ymm0[0],ymm1[0],ymm0[1],ymm1[1],ymm0[2],ymm1[2],ymm0[3],ymm1[3],ymm0[8],ymm1[8],ymm0[9],ymm1[9],ymm0[10],ymm1[10],ymm0[11],ymm1[11]
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpunpcklwd %ymm1, %ymm0, %ymm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x61,0xd1]
; CHECK-NEXT:    ## ymm2 {%k1} = ymm0[0],ymm1[0],ymm0[1],ymm1[1],ymm0[2],ymm1[2],ymm0[3],ymm1[3],ymm0[8],ymm1[8],ymm0[9],ymm1[9],ymm0[10],ymm1[10],ymm0[11],ymm1[11]
; CHECK-NEXT:    vpaddw %ymm3, %ymm2, %ymm0 ## encoding: [0x62,0xf1,0x6d,0x28,0xfd,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.punpcklw.d.256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x2, i16 %x3)
  %res1 = call <16 x i16> @llvm.x86.avx512.mask.punpcklw.d.256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x2, i16 -1)
  %res2 = add <16 x i16> %res, %res1
  ret <16 x i16> %res2
}

declare <16 x i16> @llvm.x86.avx512.mask.punpckhw.d.256(<16 x i16>, <16 x i16>, <16 x i16>, i16)

define <16 x i16>@test_int_x86_avx512_mask_punpckhw_d_256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x2, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_punpckhw_d_256:
; CHECK:       ## BB#0:
; CHECK-NEXT:    vpunpckhwd %ymm1, %ymm0, %ymm3 ## encoding: [0x62,0xf1,0x7d,0x28,0x69,0xd9]
; CHECK-NEXT:    ## ymm3 = ymm0[4],ymm1[4],ymm0[5],ymm1[5],ymm0[6],ymm1[6],ymm0[7],ymm1[7],ymm0[12],ymm1[12],ymm0[13],ymm1[13],ymm0[14],ymm1[14],ymm0[15],ymm1[15]
; CHECK-NEXT:    kmovw %edi, %k1 ## encoding: [0xc5,0xf8,0x92,0xcf]
; CHECK-NEXT:    vpunpckhwd %ymm1, %ymm0, %ymm2 {%k1} ## encoding: [0x62,0xf1,0x7d,0x29,0x69,0xd1]
; CHECK-NEXT:    ## ymm2 {%k1} = ymm0[4],ymm1[4],ymm0[5],ymm1[5],ymm0[6],ymm1[6],ymm0[7],ymm1[7],ymm0[12],ymm1[12],ymm0[13],ymm1[13],ymm0[14],ymm1[14],ymm0[15],ymm1[15]
; CHECK-NEXT:    vpaddw %ymm3, %ymm2, %ymm0 ## encoding: [0x62,0xf1,0x6d,0x28,0xfd,0xc3]
; CHECK-NEXT:    retq ## encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.punpckhw.d.256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x2, i16 %x3)
  %res1 = call <16 x i16> @llvm.x86.avx512.mask.punpckhw.d.256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x2, i16 -1)
  %res2 = add <16 x i16> %res, %res1
  ret <16 x i16> %res2
}

