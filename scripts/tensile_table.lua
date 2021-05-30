
local materials = {'Al', 'Mg', 'Ti', 'Fe炉冷', 'Fe水冷', 'PET'}

tex.sprint ('\\begin{figure}[bp]')
tex.sprint ('\\begin{tabular}{cc}')

for i, material in ipairs (materials) do
  tex.sprint ('\\begin{minipage}{0.5\\hsize}')
  tex.sprint ('\\hspace{-11mm}')
  tex.sprint ('\\scalebox{.645}{\\input{resources/tensile/'..material..'.pgf}}')
  tex.sprint ('\\end{minipage}')

  if i % 2 == 0 then
    tex.sprint ('\\\\')
  else
    tex.sprint ('&')
  end
end

tex.sprint ('\\end{tabular}')
tex.sprint ('\\caption{各材料の公称応力 - 公称ひずみ線図}')
tex.sprint ('\\label{fig:stress_strain}')
tex.sprint ('\\end{figure}')
