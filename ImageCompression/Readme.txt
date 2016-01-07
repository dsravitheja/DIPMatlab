This project is aimed at implementing an image compression algorithm using JPEG format. The implementation of JPEG compression involves the following steps:
   The image is first broken into 8 x 8 blocks.
   The DCT works for values in the range -128 to 127. Hence 128 is subtracted from the image blocks to bring their values into that     range.
   DCT is applied to each subimage 8 x 8 blocks
   Each block is then quantized using a suitable normalization matrix and quantization method
   The image now after quantization step is compressed and its size is reduced.
   It can be reconstructed by dequantizing the subimage blocks(8 x 8)
   Inverse DCT is applied to all the sub image blocks (8 x 8)
   Now we have a reconstructed but compressed image.

These steps were followed and compressed images were obtained which are shown in the results section. The DCT operation was performed using matrix multiplication. A DCT matrix “D” was formulated and it was used to perform DCT operation on the sub image blocks. The operations were like this.
   To apply DCT to the subimage block D * Subimageblk * D’ was done where D’ is transpose of the DCT matrix
   To apply IDCT, D’ * subimageblk * D was performed.

To implement JPEG, two methods of transform coding were used : Zonal Coding and Threshold Coding 
