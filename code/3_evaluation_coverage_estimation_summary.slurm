#!/bin/bash -l
#SBATCH -A uppmax2026-1-61
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J coverage_summary
#SBATCH -o /home/asma7174/GA_project/03_evaluation/polished_coverage_estimation/coverage_summary.%j.out
#SBATCH -e /home/asma7174/GA_project/03_evaluation/polished_coverage_estimation/coverage_summary.%j.err

DEPTH=/home/asma7174/GA_project/03_evaluation/polished_coverage_estimation/depth.txt
OUT=/home/asma7174/GA_project/03_evaluation/polished_coverage_estimation/coverage_summary.txt

awk '
{
    depth[NR]=$3;
    sum+=$3;
    if($3>0) cov1++;
    if($3>=10) cov10++;
}
END {
    mean = sum/NR;

    n = asort(depth);
    if (n % 2 == 1) {
        median = depth[(n+1)/2];
    } else {
        median = (depth[n/2] + depth[n/2+1]) / 2;
    }

    p1 = (cov1/NR)*100;
    p10 = (cov10/NR)*100;

    print "Mean depth:", mean;
    print "Median depth:", median;
    print "Percent genome ≥1x:", p1;
    print "Percent genome ≥10x:", p10;
}' $DEPTH > $OUT
