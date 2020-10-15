NUM_PARALLEL_PROCESSORS=8
testNames=(offline online romhr restore)
runAbsoluteFOM="true"
absoluteFOMOptions="-p 0 -rs 2 -iv -cfl 0.5 -tf 0.008 -pa -print"
absoluteFOMTol="1e-10"
absoluteFOMTolParallel="1e-1"
absoluteRelErrorTol="10"
absoluteRelErrorTolParallel="10"
speedupTol="2"
case $subTestNum in
  1)
    $LAGHOS -p 0 -rs 2 -iv -cfl 0.5 -tf 0.008 -pa -offline -writesol -romsvds -nwin 2 -tw "$BASE_DIR"/tests/taylor-green/taylor-green-time-window.csv
    ;;
  2)
    $LAGHOS -p 0 -rs 2 -iv -cfl 0.5 -tf 0.008 -pa -online -soldiff -nwin 2 -twp twpTemp.csv
    ;;
  3)
    $LAGHOS -p 0 -rs 2 -iv -cfl 0.5 -tf 0.008 -pa -online -romhr -soldiff -nwin 2 -twp twpTemp.csv
    ;;
  4)
    $LAGHOS -p 0 -rs 2 -iv -cfl 0.5 -tf 0.008 -pa -restore -nwin 2 -twp twpTemp.csv
    ;;
esac
