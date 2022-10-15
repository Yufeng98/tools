# Commonly Used CS Tools

## Verilog

#### Kogge Stone Adder

KSW is a paralle prefix form carry look ahead adder.
8-bits figure: https://www.researchgate.net/figure/8-bit-Kogge-stone-Adder_fig3_282268660
32-bits figure: http://patricklomenzo.com/wp-content/uploads/2018/09/AVLSI_Report_KoggeStone_Adder.pdf

## C++

#### 32-bits Fixed Point Approximation

https://github.com/eteran/cpp-utilities/blob/master/fixed/include/eteran/cpp-utilities/Fixed.h
Usage see http://stackoverflow.com/questions/79677/whats-the-best-way-to-do-fixed-point-math

```C++
typedef Fixed<20, 12> fixed;

fixed f_lp_emission = f_32_log_probability_match_r9(read, pore_model, kmer_rank, event_idx, strand_idx);
float f_a = f_32_log_probability_match_r9_a(read, pore_model, kmer_rank, event_idx, strand_idx).to_float();

inline fixed f_32_log_normal_pdf_a(fixed x, const GaussianParameters& g) {
    fixed gp_mean = g.f_32_mean;
    fixed gp_stdv = g.f_32_stdv;
    fixed gp_log_stdv = g.f_32_log_stdv;
    fixed f_log_inv_sqrt_2pi = log(0.3989422804014327);
    fixed a = (x - gp_mean) / gp_stdv;
    return a;
}
```
#### 32-bits Fixed Point Approximation

https://github.com/XMunkki/FixPointCS

```C++
using namespace Fixed64;

FP_LONG f_lp_emission = f_log_probability_match_r9(read, pore_model, kmer_rank, event_idx, strand_idx);
FP_LONG f_lp_emission = FromFloat(log_probability_match_r9(read, pore_model, kmer_rank, event_idx, strand_idx));

inline FP_LONG f_log_normal_pdf(FP_LONG x, const GaussianParameters& g) {
    FP_LONG gp_mean = g.f_mean;
    FP_LONG gp_stdv = g.f_stdv;
    FP_LONG gp_log_stdv = g.f_log_stdv;
    FP_LONG log_inv_sqrt_2pi = FromFloat(log(0.3989422804014327));
    FP_LONG a = DivPrecise(Sub(x, gp_mean), gp_stdv);
    FP_LONG a_square = Mul(a, a);
    FP_LONG a_square_tmp = Mul(a_square, FromFloat(-0.5));
    FP_LONG result_tmp = Sub(log_inv_sqrt_2pi, gp_log_stdv);
    // fprintf(stderr, "gp_stdv %f a %f\n", ToFloat(gp_stdv), ToFloat(a));
    return Add(result_tmp, a_square_tmp);
}
```
