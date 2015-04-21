pro bps_003
compile_opt idl2
; 12 channels in UV-2 with fwhm 0.42 nm
wav=[308.7, 310.8, 311.85, 312.61, 313.2, 314.4, 317.62, 322.42, 331.34, 345.4, 360.15, 372.8]
x=[-1:1:.05]
tri=lambda(x:1.0-abs(x)> 0.)
band=tri(x/0.42)
n=wav.length
band=rebin(band, [41,n,60])
bcwave=wav
ones=lambda(n:replicate(1,n))
wave=ones(41)#bcwave + x#ones(n)
fn=(routine_info())[1]+'.h5'
h5_putdata,fn,'BandPass',float(band)
h5_putdata,fn,'Wavelength',float(wave)
h5_putdata,fn,'BCWavelength',float(bcwave)
h5_putdata,fn,'NBCWavelength',fix(n)
h5_putdata,fn,'NCrossTrack',long(60)
print,'wrote '+fn
end

