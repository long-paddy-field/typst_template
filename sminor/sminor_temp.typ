#import "@preview/physica:0.9.3":*
#import "@preview/unify:0.5.0":*
#import "@preview/metro:0.2.0":*

#let seminor_article(
  fontsize: 11pt,
  title: none,
  subtitle: none,
  header_text: none,
  autors: (),
  abstruct: [],
  date: none,
  doc,
)={
  let serif = "Noto Serif CJK JP"
  let sans = "Noto Sans CJK JP"
  // let math_font = "Noto Sans Math"

  // ヘッダーの設定
  set page(paper:"a4",
           header:align(right,text(font: serif, size: fontsize, header_text)))
  set page(numbering: "(1)")
  align(center,text(font: sans, size: 1.5*fontsize, strong(title)))
  align(center)[
    #box()[
      #align(left,text(font: sans, size: 1.2*fontsize,subtitle))
    ]
  ]

  if abstruct !=[]{
    par(align(left,text(font: sans)[
      *概要*\
      #block(width: 99%)[#align(left,abstruct)]

    ]))
  }
  
  // set font
  set text(lang: "ja", font: serif, fontsize)
  
  // 行間の調整
  set par(
  leading: 1.2em,
  justify: true,
  first-line-indent: 1.1em,
  )
  show par: set block(spacing: 1.2em)
  show heading: set block(above: 1.6em, below: 0.6em)
  set heading(numbering: "1.1.     ")
  
  // 見出しの下の段落を字下げするため
  show heading: it =>{
    it
    par(text(size: 0pt, ""))
  }
  
  // 様々な場所でのフォント
  show heading: set text(font: sans)
  // show math.equation: set text(font: math_font)

  // 数式のナンバリング
  set math.equation(numbering: "(1)",number-align: bottom)

  doc
}

#let appendix(app)=[
  #counter(heading).update(0)
  #set heading(numbering: "A.1.   ")
  #app
]

#let introbox(title: none, body)={
  align(right)[
    #rect(width: 98%, stroke: (left: 1pt))[
      #align(left)[
        #text(font: "Noto Sans CJK JP", size: 12pt)[#sym.star.stroked#emph(title)]\
        
        #body
      ]
    ]
  ]
}

#let quizbox(title: none, body)={
  rect(width: 100%, stroke:(rest: 1pt),radius: 5pt)[
    #text(font: "Noto Sans CJK JP", size: 14pt, )[#emph(title)]\
    
    #body
  ]
}

#let colMath(x, color)= text(fill: color)[$#x$]

#let voidbox(width:4em, text:none)={
  box(width:width, height: 1.2em, baseline: 0.2em,stroke:(rest: 1pt), inset: 0.2em)[#align(center)[#text]]
}