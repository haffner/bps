pro bps_002
compile_opt idl2
; A. first 10 channels are UV-2 fwhm 0.42 nm
; B. last 2 channels are VIS fwhm 0.63 nm
wav_uv2=[309.0, 312.34, 317.35, 318.2, 321.2, 322.0, 325.0, 331.06, 340.0, 354.0]
wav_vis=[354.0, 380.0]
x=[-1:1:.05]
tri=lambda(x:1.0-abs(x)> 0.)
band_uv2=tri(x/0.42)
band_vis=tri(x/0.63)
n_uv2=wav_uv2.length
n_vis=wav_vis.length
band=[[rebin(band_uv2, [41,n_uv2,60])], $
      [rebin(band_vis, [41,n_vis,60])]]
bcwave=[wav_uv2,wav_vis]
ones=lambda(n:replicate(1,n))
wave=ones(41)#bcwave + x#ones(12)
fn=(routine_info())[1]+'.h5'
h5_putdata,fn,'BandPass',float(band)
h5_putdata,fn,'Wavelength',float(wave)
h5_putdata,fn,'BCWavelength',float(bcwave)
h5_putdata,fn,'NBCWavelength',fix(12)
h5_putdata,fn,'NCrossTrack',long(60)
print,'wrote '+fn
end

