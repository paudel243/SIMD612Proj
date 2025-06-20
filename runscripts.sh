count=30
for i in $(seq $count); do
    ./SIMD1DStencil_20.exe > debug_outputs/set20/output_$i.txt
done
echo "set 20 complete"
count=30
for i in $(seq $count); do
    ./SIMD1DStencil_26.exe > debug_outputs/set26/output_$i.txt
done
echo "set 26 complete"
count=30
for i in $(seq $count); do
    ./SIMD1DStencil_28.exe > debug_outputs/set28/output_$i.txt
done
echo "set 28 complete"