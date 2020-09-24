package app

func (a *App) DoSomethingElse(ctx context.Context) error {
    foo := "foo"
    bar := "bar"

    if foo == bar {
        return nil
    }

    if foo != bar {
        return errors.New("unexpected")
    }

    return errors.New(bar)
}
