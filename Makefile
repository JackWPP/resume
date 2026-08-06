SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

all:	pdf

en:
	xelatex resume-en.tex

zh_CN:
	xelatex resume-zh_CN.tex

pdf:	$(PDFS)

%.pdf:  %.tex
	xelatex $<

# 导出带日期命名的交付副本：王海翔-简历-YYYYMMDD / JackWang-Resume-YYYYMMDD
EXPORT_DIR = export
TODAY = $(shell date +%Y%m%d)

export:	pdf
	@mkdir -p $(EXPORT_DIR)
	cp resume-zh_CN.pdf "$(EXPORT_DIR)/王海翔-简历-$(TODAY).pdf"
	cp resume-en.pdf "$(EXPORT_DIR)/JackWang-Resume-$(TODAY).pdf"
	@echo "Exported: $(EXPORT_DIR)/王海翔-简历-$(TODAY).pdf, $(EXPORT_DIR)/JackWang-Resume-$(TODAY).pdf"

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

# 只清理编译中间产物；不删 *.pdf（仓库根目录可能有其他 PDF，如论文）
clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind
