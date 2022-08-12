<?php

declare(strict_types=1);

namespace {{_cursor_}};

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

final class {{_name_}}
{
    public function __invoke(Request $request, Response $response): Response
    {
    }
}
