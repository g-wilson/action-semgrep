package app

func (a *App) DoSomething(ctx context.Context) error {
    foo := true
    bar := "bar"

    if foo {
        return nil
    }

    if foo {
        return errors.New("unexpected")
    }

    return errors.New(bar)
}
