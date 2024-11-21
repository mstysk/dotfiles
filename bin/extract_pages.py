#!/usr/bin/env python

import argparse
from pypdf import PdfWriter


def main():
    parser = argparse.ArgumentParser(
        description="PDFファイルから指定したページを抽出します。"
    )
    parser.add_argument("inputFilePath", help="入力PDFファイルパス")
    parser.add_argument("outputFilePath", help="出力PDFファイルパス")
    parser.add_argument("range", help="抽出するページ範囲")

    args = parser.parse_args()

    input_file = args.inputFilePath
    output_file = args.outputFilePath
    page_range_str = args.range

    try:
        start_str, end_str = page_range_str.split(",")
        start_page = int(start_str)
        end_page = int(end_str)
        page_range = (start_page, end_page)
    except ValueError:
        print("ページ範囲の形式が正しくありません。 例: 1,5")
        return

    writer = PdfWriter()
    writer.append(input_file, page_range)
    writer.write(output_file)
    print(f"{input_file}の{page_range_str}ページを{output_file}に抽出しました。")


if __name__ == "__main__":
    main()
